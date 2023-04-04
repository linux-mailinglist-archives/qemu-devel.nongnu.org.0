Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9196D6831
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 18:03:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjj6v-0007ij-H9; Tue, 04 Apr 2023 12:02:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjj6K-00072K-3Q
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 12:01:54 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjj6H-0002hJ-3z
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 12:01:39 -0400
Received: by mail-ed1-x52a.google.com with SMTP id y4so132697889edo.2
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 09:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680624093;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IUb6gu3Kcv5e392t5uwZEeu97T8RPxmM4nBfmVk2FFs=;
 b=xl8ra4Vu/MYsbKajTZOE1AoOaZBJVkiD8WdY/EwLYFstPvRB6giMknc3Pk81FIeRzL
 LRkNJOanzC1VvA0IBgRlNtQC1+rdX14qfQtHpO8Wyu3HeuZWg1mQs/QzVaYdmk+WVQ4P
 GI9DEOGLa54r2s/SSbPOvdhL9EexrqVeeatIQHrT5uDfblHMKZfxV3IoZNBgcC0eOYnK
 xwachfuinVTHVpFl7cX1uA4/hPY0H54UU/xUGc1VJd2jFoS6ikXDO1yPtgrZydGajIGm
 mkeWje7YYjo+4b4vuyq+soHDfr1qVG7IC8DR3mvIKYpPBhkRR+SdWvNZep19btLoW4ND
 ZSUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680624093;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IUb6gu3Kcv5e392t5uwZEeu97T8RPxmM4nBfmVk2FFs=;
 b=MCDBLr+nIrf4Z/uhTM0evIRmjqa70Vjmzqel5m1OXcbVIuHpIg19HTPNCw2wTi+B4U
 Op+P8O7jVCTeMNCTR5dbX9Ga3nHiKyccShULGDlRk8ImJAeI9GhxAWmZOKtYRz8q97Fz
 P7b2AcDF+u9+OxK/vzIuLexNOfszkLIyovIS2NIR6mGa1hjniqE9Mr49GsA8ddA8WnuS
 AzVji+lYuIXD7eMCH8E5UcMdmGhIcE01hPoEdO5BWfIuUarJtec0WphaqV3C2IA8Lcve
 ab/WqFjvpADvD/3RMpc2PwE5G+EumTvlOkoe67FzcykGCZpfB57suJZznjRHjLAR8HWe
 fndg==
X-Gm-Message-State: AAQBX9dX8gb8nC1O/f+QmU4DCNXXRWqD94YyIW/LtcgLTPzqjycY1T72
 K+ZcFKmreEo/UNHzvmk2v06kgpwafMS8xjgoMwIPbi0R4CvDzMM5
X-Google-Smtp-Source: AKy350bpbePkIEV1sSbcqfcjkl03ya2yIH3Q/O8XfD3ZI1h/ab6Q2OptoCE1deZ4VWpE5rRgnbs7VvO0f+m0Hs6lsic=
X-Received: by 2002:a50:874f:0:b0:4fa:4bc4:ad5b with SMTP id
 15-20020a50874f000000b004fa4bc4ad5bmr1754023edv.6.1680624092899; Tue, 04 Apr
 2023 09:01:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230404113833.1909736-1-gaosong@loongson.cn>
In-Reply-To: <20230404113833.1909736-1-gaosong@loongson.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Apr 2023 17:01:22 +0100
Message-ID: <CAFEAcA_Jbg9XrtC4VGJrWrhLworkR1N8OtGRyk=ftYF9QRLSNw@mail.gmail.com>
Subject: Re: [PULL 0/2] loongarch-to-apply queue
To: Song Gao <gaosong@loongson.cn>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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

On Tue, 4 Apr 2023 at 12:38, Song Gao <gaosong@loongson.cn> wrote:
>
> The following changes since commit efcd0ec14b0fe9ee0ee70277763b2d538d19238d:
>
>   Merge tag 'misc-fixes-20230330' of https://github.com/philmd/qemu into staging (2023-03-30 14:22:29 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/gaosong/qemu.git tags/pull-loongarch-20230404
>
> for you to fetch changes up to ec28dd6c6fc1366504003c25828953cac49e2da7:
>
>   target/loongarch: Enables plugins to get instruction codes (2023-04-04 19:33:23 +0800)
>
> ----------------------------------------------------------------
> pull-loongarch-20230404
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

