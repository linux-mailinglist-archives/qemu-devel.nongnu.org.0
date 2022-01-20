Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AEE495627
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 22:53:51 +0100 (CET)
Received: from localhost ([::1]:56874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAfNM-0000yc-Hu
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 16:53:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAZH6-0005zR-BA
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 10:22:57 -0500
Received: from [2a00:1450:4864:20::32c] (port=33625
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAZH3-0004SX-U3
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 10:22:55 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 o7-20020a05600c510700b00347e10f66d1so7278604wms.0
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 07:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UAUmIK4KoBXeWJjQjEPRGTEiq5B2NqdNxvZ5sZTrWDY=;
 b=vectPWJqV8eDPqce2uL/Wtk89QKIURFsG6wcG1pKp+Tcnl4rDfiFumsXVyOXxNf1hp
 8M/SdTAnemaNiBdfiOTwX+d/kj4cmcxaA6hnaDO/+KempEjdAZ9DMQ2ArNP1gZz6s149
 iBYjou/NlnPNuLh5W2G0nQsMWh0ZDJGtqz23c2Wz25Oss95GkPc1TgnYgYpWr/t2PDVr
 HQj1kBLzinq4HMTHVgBT1lYReDOe8cVfQx/dhse35sCyIVYsmObxLGqw6z0eqTU3QGdI
 ECGHYPuIfLhuBOUC+LM5HB4OqJsrfIcxVpVi8desfuxaI0+J9RHjbicgBxjMQUWy8eTP
 83Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UAUmIK4KoBXeWJjQjEPRGTEiq5B2NqdNxvZ5sZTrWDY=;
 b=mbSSEGwEM53jeebFvLKNyrLU9IaB/mH7tW3hRfEO9DeP/17LISgc9uotCDblzGU7VD
 87JxDL4KY2AscZMrBezeoiksuO4ehZYka0umM2gq8JrpLRN7u6HXJPh6PwWY/PBX+Jgh
 mp3hyZslMdOPij4ZsuHSpSnLn/aPwwirJLXRLkWKCahQr7LxXohA2n7kchRvR8twEJ7P
 3jzZpzJOwat00ou/pcyg95rZLeJnWIwk9bUAvpE738QAvlcsqYlNeVn29/uAxBQJWQP5
 xET5UvOSZnDVOjMaQ86pDK/TASd5YzAxjoGu6DUKfXjls17dA17dfgpHobYWeUOoQBPs
 8KrA==
X-Gm-Message-State: AOAM532FlA/LVVwGPOrpK5AdwGNBqhvM/WeVWFccEeGETbUze0r4/cGt
 4Utc5xCD1/+l6gSn6ywvscW5xcvrRLCuAJiOh3NHWg==
X-Google-Smtp-Source: ABdhPJx5HwEbplQ91F6u4LNuHLAV7kgtPz949szyDsyd/lS31sTBE9EeafnxZPQABw0DAyEGwVfsuqcB3viwJr9yznI=
X-Received: by 2002:a05:600c:4f51:: with SMTP id
 m17mr9439259wmq.32.1642692171029; 
 Thu, 20 Jan 2022 07:22:51 -0800 (PST)
MIME-Version: 1.0
References: <20220120083607.1672319-1-laurent@vivier.eu>
In-Reply-To: <20220120083607.1672319-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Jan 2022 15:22:40 +0000
Message-ID: <CAFEAcA-R_Wp_8RN9K9UVthXLtonC1eMF6S-5a717XqcFP2wChg@mail.gmail.com>
Subject: Re: [PULL 0/3] M68k for 7.0 patches
To: Laurent Vivier <Laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 20 Jan 2022 at 09:44, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 5e0214cdeee17de949f2565f4429c15173179ae3:
>
>   Merge remote-tracking branch 'remotes/thuth-gitlab/tags/pull-request-2022-01-19' into staging (2022-01-19 16:37:46 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu-m68k.git tags/m68k-for-7.0-pull-request
>
> for you to fetch changes up to e48b140eef9775986cc18038c7bc68f8d2b7fe1d:
>
>   m68k: virt: correctly set the initial PC (2022-01-20 09:09:37 +0100)
>
> ----------------------------------------------------------------
> m68k pull request 20220120
>
> Fix virt-m68k reboot
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

