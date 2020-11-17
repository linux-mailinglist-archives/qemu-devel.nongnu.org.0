Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E66242B713D
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 23:08:42 +0100 (CET)
Received: from localhost ([::1]:38990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf99V-0006J7-HG
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 17:08:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kf97b-0005Yr-JV
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 17:06:43 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:47094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kf97Z-00022f-HE
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 17:06:43 -0500
Received: by mail-ed1-x52c.google.com with SMTP id t11so24086729edj.13
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 14:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WSWdIsxQwf+CX3ITKlEp9z/r0iBtDojAVhrXbPW+tWM=;
 b=TjYwlBl3kN4hPAiQSwMnvk7DsyBIErMYbjgPuPY5q/PZqiMNZZwzdF54/h7MejhAuo
 jemj/1pfoMYnNUQTZLxkyQxga6a+nEJSbLYmdT6JXVwAp6lIKKFxqmGoIvhm2MdImHJk
 +byK3HM0H8E8oeVIaR/ZyVav6rb8VTHe2VeUkirLWvm+VIs1ptc2+jxJFEAIS650bMb9
 /unDF8xhAqoopr9rgBY8RbRu2CRx7vM4VthLsXNDw2A8k3h3ElUxj20Ij7HVf4cppkQu
 SGZZAv7Pb9G9OAY9RXV/D6JNcFcImYkTJM5uz3+6cicxT8TuNq8ot1Riq4Am8tVkzuE5
 86EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WSWdIsxQwf+CX3ITKlEp9z/r0iBtDojAVhrXbPW+tWM=;
 b=C4MdI17YvKEdoFv9yU8RLPCsEqRoe5YKqq23HW3OP+1fQNhKRbO1jpr2nOSiYWi3PP
 01FQJVpoZ4qgJ5JARLp2Xl0bw6yKusWnjCx/lhi52DhbOUezf5/4ST5aPdzdqjO4lOb7
 lg4P033IR7O81WZyjbz0qrOOYN3pEFiq35gPxW0CKnrY6YWy+5/S4FP6pR0hj83bJENa
 lEhOS/qeEtb17gvrQygwBKxyRw14Z0bKBLx+wMFOqRtYvLWSr7l+E4xy96PZWDnSu/4f
 jqZjmXGlcmkIHfZPKP1lHnlCfTdHHCCPsR3EXETAisCohOubft90ZrbxMorOOdCpSrrF
 hRVA==
X-Gm-Message-State: AOAM532c4m5UyoJxZX7Bj5WuuBkYk7XxFUj0e57A56cPfodVRyqVNu+M
 dUQkdsXKvftTxdt+iQbiqEZjGp+PO2ACCqb0Q8SyZg==
X-Google-Smtp-Source: ABdhPJyfLZRreT/9nbfIoH8eK4JpYdX/Jg2cgHB3tMeTm83s98yqsWEDcxZnLDlqivSTxvpJrbEH0nu0vX52pNO5adI=
X-Received: by 2002:a05:6402:b35:: with SMTP id
 bo21mr24264772edb.52.1605650799412; 
 Tue, 17 Nov 2020 14:06:39 -0800 (PST)
MIME-Version: 1.0
References: <20201117145739.3314926-1-armbru@redhat.com>
In-Reply-To: <20201117145739.3314926-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Nov 2020 22:06:28 +0000
Message-ID: <CAFEAcA-EdocNkD8dGz6zk1C2uMbanBkqteVGjADkTY1CLpqbCw@mail.gmail.com>
Subject: Re: [PULL 0/1] QObject patches patches for 2020-11-17
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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

On Tue, 17 Nov 2020 at 14:57, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit 1c7ab0930a3e02e6e54722c20b6b586364f387a7:
>
>   Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2020-11-17 11:50:11 +0000)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-qobject-2020-11-17
>
> for you to fetch changes up to 922d42bb0d08c154602dd9112da00d22d2b46579:
>
>   json: Fix a memleak in parse_pair() (2020-11-17 15:39:53 +0100)
>
> ----------------------------------------------------------------
> QObject patches patches for 2020-11-17
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

