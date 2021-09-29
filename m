Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C7341C659
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 16:08:53 +0200 (CEST)
Received: from localhost ([::1]:56774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVaGS-00027c-SD
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 10:08:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mVaEH-0008TR-7J
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 10:06:37 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:45936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mVaEF-0004X1-NO
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 10:06:36 -0400
Received: by mail-wr1-x436.google.com with SMTP id d21so4451996wra.12
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 07:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=urQi968hSfsE6Mz3+0rVESzL93Z2in2nNBbDjlbU/jc=;
 b=R8NT8ARuN21BiDJ+UKRXHuU7NFKy5OP8vM0y/7fZJtEaRZ8SpshyckMmvYJeNOW3Q+
 F4lxeNi4WLXR74cckV/z0jJZ4f8Wb+Np765UfTg3kDQoJOrHf6d12uhiSvflKOS2ezJs
 V6cxlk0O7czbSwtaY/+ErSNe86TVWvV3x7kLl+YR6A4NPIx7u8sB/SF9nw5mHOTuoFBx
 j4jjPcXdUvJPZlrxco8NQaJ1JJ5KE47gVI5RvMIqoHKPa4wlLLj1ZRuJ0zto/BZJIPgd
 aL8eXRDjimyWWIm63l3v05vFa3D6oPj1ecziv6Az6X85QSA8FCbQmYHr0gkkAkjdfoTp
 sEkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=urQi968hSfsE6Mz3+0rVESzL93Z2in2nNBbDjlbU/jc=;
 b=QhdxIV66unMULoDLPGSm6l/fikLTgjbmil74V7YVzc38sBvfbnyIlbemkwh6HjM6Ym
 6W1YghnTImfvd5NPYTF8R4ZoV+TI3hs+EHR8fdeJytidi9PerngJMUGbUJWiGET7AM09
 WA+l2IxgCPgW70/8xFcfGSlfnzOPHawpi+Gi41ubAmr0ctLl7dgvg0uaxhDjwPE9ORDt
 8xedyWSSYT3QhqoAvx8zcx7XW2TRrDoo7qOf854GQ3maM5ghgO6Oz1QDGOl4pjRsJyoC
 fpLUAjZ2hmgio7plUK1Vy6m5WDB/9McjYwQ6A8IIp1gvOzzXype/OLsQqUCWmTGtYm7Q
 ZFYQ==
X-Gm-Message-State: AOAM533Vc7qaYPyUg1C7EBRfHf61xm+lmfT7K+97zzaOLaS1cfwBBi5e
 DBYgQHmoLrJldyBnNpa7jwP7r9qeFGE=
X-Google-Smtp-Source: ABdhPJySuVCw9vfw/1CiYsvpkdRexVKhKSAshOc24kEYDaLrQgfdULzeRLSN37f6HpXn8N5AlV/4VA==
X-Received: by 2002:adf:e650:: with SMTP id b16mr7083880wrn.393.1632924393691; 
 Wed, 29 Sep 2021 07:06:33 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id t13sm2379938wro.76.2021.09.29.07.06.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Sep 2021 07:06:31 -0700 (PDT)
Message-ID: <c9a1eacd-b4cf-f19c-3ce0-f5bfb7319299@amsat.org>
Date: Wed, 29 Sep 2021 16:06:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 0/3] hw/input/lasips2: QOM'ify the Lasi PS/2
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20210920064048.2729397-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210920064048.2729397-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.03,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>, Sven Schnelle <svens@stackframe.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping?

On 9/20/21 08:40, Philippe Mathieu-Daudé wrote:
> Slowly nuking non-QOM devices: Lasi PS/2's turn.
> 
> Philippe Mathieu-Daudé (3):
>   hw/input/lasips2: Fix typos in function names
>   hw/input/lasips2: Move LASIPS2State declaration to
>     'hw/input/lasips2.h'
>   hw/input/lasips2: QOM'ify the Lasi PS/2
> 
>  include/hw/input/lasips2.h | 31 ++++++++++++++++--
>  hw/hppa/lasi.c             | 10 +++++-
>  hw/input/lasips2.c         | 64 +++++++++++++++++++-------------------
>  3 files changed, 70 insertions(+), 35 deletions(-)
> 

