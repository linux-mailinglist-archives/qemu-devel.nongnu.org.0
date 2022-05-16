Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C27F527B9A
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 03:58:14 +0200 (CEST)
Received: from localhost ([::1]:45786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqPzw-0005bK-Rd
	for lists+qemu-devel@lfdr.de; Sun, 15 May 2022 21:58:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <itaru.kitayama@gmail.com>)
 id 1nqPyT-0004rH-FC
 for qemu-devel@nongnu.org; Sun, 15 May 2022 21:56:41 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:33312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <itaru.kitayama@gmail.com>)
 id 1nqPyR-0003Ht-Vb
 for qemu-devel@nongnu.org; Sun, 15 May 2022 21:56:41 -0400
Received: by mail-ej1-x636.google.com with SMTP id gh6so26042130ejb.0
 for <qemu-devel@nongnu.org>; Sun, 15 May 2022 18:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=IGsmW2x9Lhp8KYStoPGYr/4neIzydryvRwdd1daiDlk=;
 b=c/IegGtISF3+WPI6mQgnr9Gba3xM2URn2wiBOEVswM2yHTejOFVydsw8D65adrhNan
 9NY62ondlPnK00nbhVkNXNKOTSBaYj6P29QcWffpqRSYSG5E1VpH+gQL0FfVUAiG/bLM
 avPFjkDHwYcwLaGoDaseEHpPyPjR9+GISDuA6MMEVi3bdOGVj+U3F8xlL2COJB2aB/7M
 mlkwJ7TyNTojEByFl0eA6Xo4Emn+MlXMbY0OqF+zJcCl1zO6m2KClh9I6mYLEyJB+dTh
 qJl4LBJispwlXc7Lw+86ERT6u21HvrBK+NbmdBZJ4pt3GBhhfv+Fnpprs1R/dcKGPywS
 qLQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=IGsmW2x9Lhp8KYStoPGYr/4neIzydryvRwdd1daiDlk=;
 b=Eq6oxbaL0pPWuvpmKLEIk12UMC0lAoN06eaxF3kEifJrVc1m42NkNxCnnMVgwMYS2T
 7JmgiDNo1AIeL/KsJZkyGqpRNyS/WR9Z2TFerCzj/IDwQ1W8AjzftZU2t6/ha6TVPJ9r
 dcMGgOrGX+7brQ0Vtxz46Kozo7HzBQu9WT1eX1Jsh3EzQMrX+YxJsQvoKdhK96qHNFNe
 aoa4MNA3iKehSZwX6LyDUzuN9AYsJ7+nPlDnstxCGwG/H4C3budbaqCcGXPqNfxqYLW9
 CudzTZ9oZ0tls/Q99yUSDnpwLNc0uBqOI/99dIoV6EJekuQvuxxDwyygoxrqNXcX49VM
 gpLg==
X-Gm-Message-State: AOAM53151DV/RPqH+PnYulV3IqcMqw5F3mBui7iJ12pPodtXe8NhtIsO
 ipHzGqtEwY+36WuOH/AI97m5GzXVACKGzXEO3v9+wSMm
X-Google-Smtp-Source: ABdhPJyDT52GrAyNeulWGWHW+YEJ5wYkFSu+9JFQEzyVF096M39lFYRcrrL9XhNYUTwgQfsLI7qIN4T5K0pJoAuSJl8=
X-Received: by 2002:a17:906:5793:b0:6f3:d546:1764 with SMTP id
 k19-20020a170906579300b006f3d5461764mr13353642ejq.247.1652666197328; Sun, 15
 May 2022 18:56:37 -0700 (PDT)
MIME-Version: 1.0
References: <CANW9uyss4-NC3SH7xzofpMbu-cn4aDVT9Vvwjk6_JUzBwX4ioQ@mail.gmail.com>
In-Reply-To: <CANW9uyss4-NC3SH7xzofpMbu-cn4aDVT9Vvwjk6_JUzBwX4ioQ@mail.gmail.com>
From: Itaru Kitayama <itaru.kitayama@gmail.com>
Date: Mon, 16 May 2022 10:56:25 +0900
Message-ID: <CANW9uysaP5dFbXNi-ZmvhMJ9ESzHbqrhoLqXR05c2gBhQS6Hfw@mail.gmail.com>
Subject: Re: CPUs supported by the sbsa-ref board
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=itaru.kitayama@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With the latest, manually built TF-A, I was able to boot a72, but not
max. Since `max` type is supported by TF-A, I think it might be
a Qemu issue.

On Mon, May 16, 2022 at 8:21 AM Itaru Kitayama <itaru.kitayama@gmail.com> wrote:
>
> Leif,
>
> I've so far only booted sbsa-ref with cortex-a57, is this only CPU
> type supported by the board? I'm using TF-A's latest branch, but the
> PLAT=qemu_sbsa is at this moment, kind of outdated.
>
> Itaru.

