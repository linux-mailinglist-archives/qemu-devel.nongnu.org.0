Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD7D27E6B7
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Sep 2020 12:34:40 +0200 (CEST)
Received: from localhost ([::1]:41754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNZRX-0004CR-UY
	for lists+qemu-devel@lfdr.de; Wed, 30 Sep 2020 06:34:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kNZKZ-0004qZ-54
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 06:27:27 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:42429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kNZKX-00077g-3V
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 06:27:26 -0400
Received: by mail-ej1-x634.google.com with SMTP id q13so1997034ejo.9
 for <qemu-devel@nongnu.org>; Wed, 30 Sep 2020 03:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m814gk6TUi/1yQvIyqh2gt4RwYpLrttFpHdkEr/i7oY=;
 b=A4tNIbo7j4SRDdJc8JpqrEfSSLn7/mdW8gPUmatxonlB+lsvr8frgX/vnBG4B1pypC
 kAYmUY4zzvoC9ZTO+3csOU5VZ7s17fXIC0bGf9usN9iuJ1V8qMntZal4P6XywJm9P+AF
 TAcWTDhfoNmplZy7ybnhteVIQgLkfl3hfNIDG8ew9PxVjcFyvmSBMfuilG9xIfz2q+QK
 Rs3oecLo3E0STr6BBb4WGPBQmkxtNQNJhBVseVxMAW6UelIvhg/DxNj8W6ABmdP4rPsn
 sJM+7KQMBTmECkY/1yfO3XawhxKvEqpantM5C6TojtJSJ8I2ZwzCLdKIoFCYqubowSjz
 CPpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m814gk6TUi/1yQvIyqh2gt4RwYpLrttFpHdkEr/i7oY=;
 b=mzvZgSwAjga3jySn+fXIt4UBOnotcYKvEeSJcSeuCGObiTivdRr4xadE7Uw0LjOydQ
 px1tGSmGZTU+jk31fpA7Wv2MQRfzv3JO3Fnnh/DC7/XzeFaOnMjQp2ScPMMv6DGt/vti
 7MjYEu5CBzzW7NBTROHScANuZSTYXJaQp1SfWx72VmQWPdxR9acALYMhhPOMXFsT4lBw
 vXfeufaG8g6Fk1kNEc0cJodvenM5kk7MLQ30TvrUU0gU71O2XmnHpcIY/B187ttIVo/N
 BHCRc2QX0ppMLrjo2QGRJOVrwCEKOGGvcztCH2FBiD+qI3jIbAR1GcAKih4kws4GuFMI
 TX4Q==
X-Gm-Message-State: AOAM530VrF+mT+BsJr7j3pY3nCE4lhlmH1U1mwxRYMUM7S4uONnCtug8
 Or52MXPpYg7POrZeNvB1FrDYmnvRgNCcN6VyuAbCtFCvAdaDzYPR
X-Google-Smtp-Source: ABdhPJyBtcegeHJQOdPftzP+5s4dpR8otAkthHLvFnFQMvy34JZ7I5FGvPlW74+HRhIoB7fyyGu1KmAJhkOE2C1gs+4=
X-Received: by 2002:a17:906:d936:: with SMTP id
 rn22mr2114857ejb.4.1601461643318; 
 Wed, 30 Sep 2020 03:27:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200929201926.2155622-1-armbru@redhat.com>
In-Reply-To: <20200929201926.2155622-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 30 Sep 2020 11:27:12 +0100
Message-ID: <CAFEAcA9kXaX_WqY5exxEyGDm=-TnNyQM2qdSB+Hz9xjzRi7kKw@mail.gmail.com>
Subject: Re: [PULL 00/29] QAPI patches patches for 2020-09-29
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 29 Sep 2020 at 21:19, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit b150cb8f67bf491a49a1cb1c7da151eeacbdbcc9:
>
>   Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2020-09-29 13:18:54 +0100)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2020-09-29
>
> for you to fetch changes up to 7cd77fb02b9a2117a56fed172f09a1820fcd6b0b:
>
>   Remove texinfo dependency from docker and CI configs (2020-09-29 17:55:39 +0200)
>
> ----------------------------------------------------------------
> QAPI patches patches for 2020-09-29


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

