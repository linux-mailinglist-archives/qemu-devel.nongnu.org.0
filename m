Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A045F31D0
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 16:17:56 +0200 (CEST)
Received: from localhost ([::1]:39614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofMGZ-00052S-1r
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 10:17:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ofM6V-0003xp-Ia
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 10:07:31 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:45928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ofM6T-0005TU-TE
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 10:07:31 -0400
Received: by mail-wr1-x42a.google.com with SMTP id a10so4575908wrm.12
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 07:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=HOTpNRcufhY33Z8NGRfGefj77azSd+8Ioke9dsiKv1A=;
 b=kAHKlDaIVYRYCajMd/6D5KscrC8tUswV2yE0zNd2WDBZ9hghpYTnewycpYmx4l0bSz
 cy63eHxDxKa3axUFdeJUFIBu8fTCBfUBHsgEOnPG6cL+b85WpliHPoaLBNnDE5MHxX41
 BFXmvqSuyh+ryG/t15qdiUdumNCpsMLFtCpn7Jy5Bjahr8SJW+WsRDVuno882n0X4L2X
 +5IdeiDfWq4wKbtHj+dQcp0zfkvNiNtQlADDEN+SEeOyRXqxh7IyMi9Se4hmL3/c4mFd
 jQAuWafMbIFRQ2ugod6W2wvagu8UWDzsFrfh/aMYIp93hJlgs5AMMsgn+sCSHLoBNWR6
 Bdgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=HOTpNRcufhY33Z8NGRfGefj77azSd+8Ioke9dsiKv1A=;
 b=xE7mikB2v7wyhkZytSVznJR2QKoRvS6IUzm7mOTo06Xk6ipiVMrQ0x5ZQ2lj5dAM/0
 2xUZVSRoP+nRjVHkau/4TJYdxH87bnhvA1q91fTQgTm4dba9PBOnaXE+eVIpPPJaKCQ2
 ti/wZ/afyCgWkqZtnRAJP4dAiYVA+SQv20mnVZ5+92D2RYmdBSN08IDy51spqnZGD3gz
 3uVtD91R58L3FCb1J+NczL+tGVx7VZ8Y5SMnZEODmgTZTM5ZY1Iy1s785ltxTFLcWCw1
 SOd6jItVnWKNPwu2yITCuNj2/SZ3/9761e6a8XAAhshbhVl9J0/rhamSMXd2vdDU86gP
 DjBw==
X-Gm-Message-State: ACrzQf0WvswPFz2oEkujPPQNx7NPAj6+lz/IAVpHMOFnLGZfetpyFtIu
 PN4A0roKL01KKmAkB06mn/KJj9eHquY=
X-Google-Smtp-Source: AMsMyM64oGc7loG7jExghmlLg7gAhTT7J15tS10dXNOcJrm1gCG4gfDUI2Xzgn0ezmTgizctLbITdA==
X-Received: by 2002:a05:6000:1882:b0:22a:f402:c975 with SMTP id
 a2-20020a056000188200b0022af402c975mr13328289wri.532.1664806046757; 
 Mon, 03 Oct 2022 07:07:26 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m24-20020adfa3d8000000b0022ae401e9e0sm9656638wrb.78.2022.10.03.07.07.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Oct 2022 07:07:26 -0700 (PDT)
Message-ID: <a5c6c02f-18a2-a08c-70d6-a41ee40f9587@amsat.org>
Date: Mon, 3 Oct 2022 16:07:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: =?UTF-8?Q?Re=3a_=5bPATCH_v1_6/7=5d_contrib/gitdm=3a_add_Universit?=
 =?UTF-8?Q?=c3=a9_Grenoble_Alpes?=
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
References: <20220926134609.3301945-1-alex.bennee@linaro.org>
 <20220926134609.3301945-7-alex.bennee@linaro.org>
In-Reply-To: <20220926134609.3301945-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.467,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 26/9/22 15:46, Alex Bennée wrote:
> again to the academic group map.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
> ---
>   contrib/gitdm/group-map-academics | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


