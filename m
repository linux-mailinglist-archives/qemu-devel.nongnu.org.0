Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D12952AAC7
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 20:29:03 +0200 (CEST)
Received: from localhost ([::1]:53692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr1wG-0007lP-5J
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 14:28:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr1tD-0006li-Kd
 for qemu-devel@nongnu.org; Tue, 17 May 2022 14:25:47 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:45693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr1tC-0004P0-1R
 for qemu-devel@nongnu.org; Tue, 17 May 2022 14:25:47 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 w17-20020a17090a529100b001db302efed6so3016728pjh.4
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 11:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Tw27zranBMMZHYjt2Np1lKUlKmRfuaeqZz2Zxl9uTV0=;
 b=XpZnTd+35CullOUOBJDO19GKbXJziA7QBy7NkTWsMHR6lIbI7W7ZZMyoXm+NzqJcdO
 e0fo/ESe5bHqEP4o4X4qAi+6sjVsBkOaqgcj/Mr8Nf/jqd4C8n/041jiDDLIcifJo8Sk
 Tx5169R5g+frtGQTi3hyxF0gEbo5xB67EwdVbhTWo0+54/FHRXtBmGcupTIQUbbqaybz
 d28nZqbFhtiRWxOytpfL0Tp12YvZHsxJ5sOY6RCKTyNDKHD5aXgmHjDOnq32lLjzGPXH
 WMilbyZwIxf2BSyheb4gxoCqSsHchL4LqI6eUbxq/4JEledfTBBn+qCMaqrq+2uGz/tn
 uuxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Tw27zranBMMZHYjt2Np1lKUlKmRfuaeqZz2Zxl9uTV0=;
 b=BzJosXBb4Uw4uTeXu3+FF0S1qjDSEbDRdXRt7uG0y62H4hrJLDyIgnmAgxDTIh1P5H
 biNNvOhgdhRz+rQSDjaROZ7fHJtEDBUMr2dB9Bk7nGuS7UOr+RUo1IN/APY4alJ7AmeE
 68wdSmdkIeOByWdwV0BdMmZ641nIW7uqxjlggDIx9AyNMKgrXYsSHZowPeG+45NsBEI8
 V97/Ul8FkhRPU0Y46dh7lJeXSFp1P7FbIVqmPteA1u239Ps7e9I6xvUzC/YLvXL2LuQ+
 iCxWXXq9eVv840/4cHb9sXXK8BzsMyWai+2GdpJl/Q01OSEebdFOipKBdPz2OUgySvfV
 wBjw==
X-Gm-Message-State: AOAM5308Ddx62g2UGKGyEbPMZwIXl9Zs/SANjeoYv06W/BvxiYjkD1j1
 e/EWqwhjbvK+eS0uU975IAqzRw==
X-Google-Smtp-Source: ABdhPJyz4Mk3dIPVgce/XZkMEA3NNu4SrtD6D1nJxDgOgvDds0dnUVG6nhdNgOat61sK4Ao85qj5Sg==
X-Received: by 2002:a17:902:ec82:b0:161:6f73:b27b with SMTP id
 x2-20020a170902ec8200b001616f73b27bmr12652368plg.133.1652811927954; 
 Tue, 17 May 2022 11:25:27 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a634a50000000b003c14af50639sm8969532pgl.81.2022.05.17.11.25.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 11:25:27 -0700 (PDT)
Message-ID: <1ff3d484-fb70-1ca0-3447-f5e29a5cb45a@linaro.org>
Date: Tue, 17 May 2022 11:25:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH RESEND 01/10] target/ppc: Fix insn32.decode style issues
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org
References: <20220517164744.58131-1-victor.colombo@eldorado.org.br>
 <20220517164744.58131-2-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220517164744.58131-2-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 5/17/22 09:47, Víctor Colombo wrote:
> Some lines in insn32.decode have inconsistent alignment when compared
> to others.
> Fix this by changing the alignment of some lines, making it more
> consistent throughout the file.
> 
> Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

