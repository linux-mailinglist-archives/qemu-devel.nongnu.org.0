Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 258B16B4533
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 15:31:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1padm6-0001hS-26; Fri, 10 Mar 2023 09:31:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1padm3-0001h6-Vo
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 09:31:12 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1padm1-00008B-5v
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 09:31:11 -0500
Received: by mail-pg1-x533.google.com with SMTP id d8so3147199pgm.3
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 06:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678458667;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hti0sY1kS++Ec+FCzSunh/GZE1c4sL/w0NCtxNsznqs=;
 b=WoNEyJYZ1wsdhHjVCnUxLJduAZTr4yNXUXU2TRCjuInSkT616ZqrKJ2+C0C1r+E/65
 fKYWIp9o3AVgnxIAgjUlU61Su3ZtVe6HXun0RcMJqOk/L5mGLAiuL6zUUJOphBqqAEmr
 SoitKOa9rV4bgxLk8xTMRNLqsO0ux2G6zW+9TrTmoMclyxZwfh6XUFpWYuy7iKgyKTUn
 cGmSAmPoroqqjPqpoa0h6wYzwYSTHWEGvLkJCshzPig3h9iISCYpWOU+OGfyYB6Uam4v
 F9w5123n4TtTSI8vILTh0GIn1gGXgtz5NVDOkdBLkNVcI9DkWiXpWQghAR8Xw1zqAdO9
 odBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678458667;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hti0sY1kS++Ec+FCzSunh/GZE1c4sL/w0NCtxNsznqs=;
 b=zGtbvqvdZQdSdek4St/Q6TgvZ8+h2CtdeNJa2Gb9pBF6tDBD9bHJOajteTnoQUHkk4
 +eaLT0yGqAEQggL1gTqf94ENFbh3gsHJd9DTWumCbdOIJwtHdTTusMvb8XiEY0Gax4LM
 2ixSWeos/WMsGZG5ikpMBdz8KHFpKxVhPzWZ75xvUCIcn4ibdpilWol0bKoczDT5X9As
 aqrY9un6Yu98sJRn9PsnKkSB3Viwl8wt0PeK0S1Efy5SX0mnBCvvzoVXje3+rcDs2Kg1
 n2G87T6/xfzhqDsIm3qoGWWClsnUP1U9YGuYTT+dZwS15nECZAAAY/zuc5gv/uhLsjOW
 0KYw==
X-Gm-Message-State: AO0yUKUpiJIkQd1/lmVak9YPR70Lv2b7rRv/oeJxr87lk3fLoALmdS81
 DYBZlaSV++EiSS/s5JnNMU3nHyJ8EG06NZdQAXFxzw==
X-Google-Smtp-Source: AK7set8Fn2A35yDSgEowtzvIYA85CJWzmufQsQqiDc80GiK5pNcT8V8jwLFjLeakfTMddTzvqqpN0iiarTIyOC9qY7Q=
X-Received: by 2002:a63:7d03:0:b0:503:4a2c:5f0 with SMTP id
 y3-20020a637d03000000b005034a2c05f0mr8380180pgc.9.1678458667270; Fri, 10 Mar
 2023 06:31:07 -0800 (PST)
MIME-Version: 1.0
References: <20230308200419.453688-1-kkostiuk@redhat.com>
In-Reply-To: <20230308200419.453688-1-kkostiuk@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Mar 2023 14:30:55 +0000
Message-ID: <CAFEAcA_=EMp=6bRLdMx4BJtuMyKoBNVk5Ox=F3z8U4dupkcNMA@mail.gmail.com>
Subject: Re: [PULL 0/5] QGA Misc patches
To: Konstantin Kostiuk <kkostiuk@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, 8 Mar 2023 at 20:04, Konstantin Kostiuk <kkostiuk@redhat.com> wrote:
>
> The following changes since commit 9832009d9dd2386664c15cc70f6e6bfe062be8bd:
>
>   Merge tag 'pull-riscv-to-apply-20230306' of https://gitlab.com/palmer-dabbelt/qemu into staging (2023-03-07 12:53:00 +0000)
>
> are available in the Git repository at:
>
>   git@github.com:kostyanf14/qemu.git tags/qga-pull-2023-03-08
>
> for you to fetch changes up to 0961f929c66ceb5e9e95756bfe418b9ef34510eb:
>
>   qga/win/vss: requester_freeze changes (2023-03-08 18:26:50 +0200)
>
> ----------------------------------------------------------------
> qga-pull-2023-03-08
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

