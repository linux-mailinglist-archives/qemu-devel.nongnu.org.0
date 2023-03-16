Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C509B6BCAC5
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 10:27:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcjsL-0003WB-Ts; Thu, 16 Mar 2023 05:26:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pcjsI-0003Vi-M7
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 05:26:18 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pcjsD-0003ke-Cs
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 05:26:18 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 gp15-20020a17090adf0f00b0023d1bbd9f9eso4716840pjb.0
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 02:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678958770;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lbtWZIiSaSzYumb67f1G2nFFzjiezNcOPT6MC3WD5QU=;
 b=wIa6uPuq6+2JGTsJCarBtWVpaJvLjbZa+YBAskqYaYsCm2M5+/rSIQHmiWybjESEM+
 TDrfb4LHFpSniae8pwn0VWEeGvr5/ImcmZqmSgM2xmGe6ERMf5i4PwAflF+r0Wh/w9u1
 b6WW7KPy4/WaZaXgmnPx51ndWk/HkznrVT+i/GSSWbOeR949mdD+E/VnbXR0VEczSvWG
 iWbDti4/qs3hVpkS4fzhPqb1MsRCdCQLLH4JYsy51deFLrMSLCXe7qGKeTxv+hiqXNqW
 BRTEk82ERtD1yoSccIOM0XvuortLoZg5Lmi60HsFDdvJQdLe7XmzI/Ej0G9VQkb/8WVy
 Kh2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678958770;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lbtWZIiSaSzYumb67f1G2nFFzjiezNcOPT6MC3WD5QU=;
 b=pzZxlr4VAI7WhCyg2vRglYL9rK6CFROFijWqgy2fdJKqeWiNkekx1VBD91aDcjBO5u
 /r6ky5JVsPa7Ioq4OvEkuqmBnwKtS5+nakkKHQlb03AQ83Tk5U92owi1zp6gE/06OKRF
 yof/3aPRgm8f4KBExj9H7eArfISo3BLED8ijJC3th7y/mbCLSaQ9LxwPt5FjnZUT+RK3
 QzATCWBaeN0e3bKO7JAYqZ9on1qamZHaFyVDyT7Yd/yO30WZlC4GeEDAv/Q3o6B3s2Wp
 zShkKYHnVsPc3amELXiIX0xC1uYXFQ3qzdp5XEmhsNs2VmL2IwRd8QNs4kWMmENm/wqo
 /Ahw==
X-Gm-Message-State: AO0yUKU1Nv3oeQs+hmCyvgH1d4qg6AP3FVO4lsIun40tkBUIIj7SbIn7
 R+S4KKW4L2rfjznwWSRfNsUq0uGd3axDpYm6Z1HWrA==
X-Google-Smtp-Source: AK7set9gW2sooH2VSgyEMnex60ZdRQfsPQT4nHJ6SU/dI4gVOmIKGFDMJDR9p4kNc5iYr/GRpK1r4rf59GJAhMN1dAg=
X-Received: by 2002:a17:902:d490:b0:19f:36ab:c2a with SMTP id
 c16-20020a170902d49000b0019f36ab0c2amr1118735plg.9.1678958770451; Thu, 16 Mar
 2023 02:26:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230314162540.385954-1-berrange@redhat.com>
In-Reply-To: <20230314162540.385954-1-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Mar 2023 09:25:59 +0000
Message-ID: <CAFEAcA_L=P7DhAyxqJn=LDKuZKksTcEtzHfdndnbkvCeO_ihnQ@mail.gmail.com>
Subject: Re: [PULL 0/3] Misc next patches
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Peter Lieven <pl@kamp.de>, Hanna Reitz <hreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, 
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, qemu-block@nongnu.org,
 libvir-list@redhat.com, 
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 14 Mar 2023 at 16:26, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> The following changes since commit 5cfda4ce79dd455f1726874a555260a70f84b2=
ec:
>
>   Merge tag 'pull-request-2023-03-13' of https://gitlab.com/thuth/qemu in=
to staging (2023-03-13 17:09:33 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/berrange/qemu tags/misc-next-pull-request
>
> for you to fetch changes up to c3a2c84ae3c1d5483ec30731321a674797dc5203:
>
>   io/channel-tls: plug memory leakage on GSource (2023-03-14 13:41:21 +00=
00)
>
> ----------------------------------------------------------------
> Miscellaneous fixes
>
>  * Avoid memory leak in TLS GSource usage
>  * Avoid sending key releases for lang1/lang2 keys in ps2 keyboard
>  * Add missing key name constants for F13-F24 keys


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

