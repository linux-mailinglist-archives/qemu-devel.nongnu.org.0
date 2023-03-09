Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B868B6B2136
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 11:21:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paDO1-0001W0-KQ; Thu, 09 Mar 2023 05:20:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1paDNx-0001Vb-SE
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 05:20:33 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1paDNw-0002o4-7C
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 05:20:33 -0500
Received: by mail-pl1-x62c.google.com with SMTP id x11so1431870pln.12
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 02:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678357230;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dN6x/50QnRtitXeBNurZVqCBCvuGuMbTKs2zZrkaoXY=;
 b=TwlsHXzyJp5nqhKiwDmQH9daqDYm1EjJo+FU4Z7/184Kw7Baa6Gv0/T1tdNNx1xpDD
 aq9KC5ScgtyymJ6eYMnS3LOEz5r1yBLGY77qO0LSIos//31f0/tO+venWkj+F0Qm8Poz
 cnRrN3sUld9LHuvQpBYMR+svXq0hqTxtKvB6JVo5S/dkZiDLGRFs5nJRWfZB8HHYDw+h
 H0G07bBkstVIBAKcRUNDwuEN7uPQe1lcDh35ITXrvIbSTs1ZT5nUC3DA7FeoxgKj2F7i
 tPXcPLDAqMt3vMdqjlrIgCEXHHoarVIQS9Dw26gw9qIPQE/AIi2E+QZ5xTdQV/PZNu/a
 yTBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678357230;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dN6x/50QnRtitXeBNurZVqCBCvuGuMbTKs2zZrkaoXY=;
 b=cwkys3yL/i8bvL6124CVCayJdLKEwXzSQPj1RWOOgGhz+2Yn+KKPbkUu/6FmuZDtzo
 G+cDhOB7botUuJp8mpB7aWkZQ05fLvAqwIrt0qBKAaNUbfCMyY4qO+eXhz0xUl3TuX0B
 S/h8gxKqAdtVb7JvWD+LMGKjpqKEIgZKFceNitUflFJyjiTx0KIYz0VgmVV/OhcbpEda
 CxJKu14g2IbjNHF4WmPNDgn3cW99eGRQJjWZLvQPgENPy3MvYjZKVZd6RSTLk9N5LlFH
 Dc/ABLRIDDvYZsrDFecctppwUPDsygHCF5okjPN6HdM53B8eFNylXrBsRCYSpsXuEJST
 lBsg==
X-Gm-Message-State: AO0yUKVAfcGWjOL9QVUcRkFSmy8ZBMFq98T4xRRTCPSNyAZl+OEbuRcZ
 nx7XtVPSAhEuFGiPQpXGnO7y+zxed8gbthrTLnzVkg==
X-Google-Smtp-Source: AK7set+BYV2VHHDAOKVJC3A1cwxvoc1E1ezoHRrDwJgLX2dYkYP/llGpiPQTNiS7Ph5eJLDGJ0iBP6xK6XO3GgM7V1M=
X-Received: by 2002:a17:90a:d18a:b0:234:c035:7749 with SMTP id
 fu10-20020a17090ad18a00b00234c0357749mr7512975pjb.0.1678357230328; Thu, 09
 Mar 2023 02:20:30 -0800 (PST)
MIME-Version: 1.0
References: <20230307114329.158094-1-pbonzini@redhat.com>
In-Reply-To: <20230307114329.158094-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Mar 2023 10:20:19 +0000
Message-ID: <CAFEAcA8OV0F2CkH=0Yy7pjvTN=Q_TNpSgyiHBeEBBspzZbBTzg@mail.gmail.com>
Subject: Re: [PULL 0/9] Fix missing memory barriers on ARM
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62c.google.com
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

On Tue, 7 Mar 2023 at 11:43, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit c61d1a066cb6cf90662c82d0e35660fc0ccacbaf:
>
>   Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2023-03-02 16:13:45 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream-mb
>
> for you to fetch changes up to 6229438cca037d42f44a96d38feb15cb102a444f:
>
>   async: clarify usage of barriers in the polling case (2023-03-07 12:39:53 +0100)
>
> ----------------------------------------------------------------
> * Fix missing memory barriers
> * Fix comments about memory ordering
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

