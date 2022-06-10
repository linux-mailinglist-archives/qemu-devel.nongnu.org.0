Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F52546769
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 15:35:22 +0200 (CEST)
Received: from localhost ([::1]:49152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzenJ-0005Kx-HB
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 09:35:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzelc-0004e7-WB
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 09:33:37 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:40763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzelb-0000NC-AK
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 09:33:36 -0400
Received: by mail-pf1-x435.google.com with SMTP id z17so23867361pff.7
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 06:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d2qGDj34v3HTWVdRV90BQsaYFYARE3SXlV/0yZNjtHc=;
 b=DeT8yGJLE/PBCslJRaEZwJAgoJrFma+D7F+WvXg4xoGLUvnpTx3nvPAlHANU1sVDPX
 v1hvyGHE6/qRmf3EJvnrFt/ZVTFACOtqmqWkKYyo3G2/cXVSYwzIMIErFZgxPPV5e+99
 UKgrsaZIt4kZu75WmHZPxJPR5GPEYbxlYWS8jgmH5ey0fxYLk+hDg0xQ7QhPzLcPDLCI
 w/qZ2HnxhYLIBdsU/kDrxL9nlovCW33yRAivKmY2jOo7vz712fWUH1vAxG8AlEz7tcXE
 F08SIGguA0n5FG36y4bE083p8uh0/jzhVJjMQHsn5f0vA6Bxwb/tJSKyfE5y2IdgwxjJ
 rz5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d2qGDj34v3HTWVdRV90BQsaYFYARE3SXlV/0yZNjtHc=;
 b=QXTMPJNtTxrczjKSkG6raDut+P+TdTUx724rDBNOSpEr6Uw2/oDm2/6Eg8/VPLqjnC
 1qGky+GDTAPTpVxekiqD0MZGEieuplbOoV8DlW8Wi+kq+4/kvGXJxREcoo05IJMXWxju
 XO4t8mmXUEFj/iAhyTtmeHyiq61VSQ5+gpFtM28OYX2hpjZXtG85A9qeyCgyIGjczymY
 dP2uwDO3375fJm/Rc9qGYYBkX0WqjeHNCk6DrrzStfBdkTov6PuR1w2+W6mSnNwpTFCt
 ROyniHBD5DwHK3ZTKfQKnPn3SIp0eGppczGp2cefR753PiF1bGJcuveGxBFRmTRJq0MY
 oeCA==
X-Gm-Message-State: AOAM531895OIaFcqUqbmhtS+rO9Q0QihzZbGt/A8mTAy/x/VZPEGIzJx
 kRaMj5PmsDX+tYUzFSQIZSJh3V7DAyk=
X-Google-Smtp-Source: ABdhPJxrkjtE5DiXowuIbT2U4XhD1+yyWyAAMwWUKzBQLnvpimYMHUVdKS7i931EzPJE7naYxCshEg==
X-Received: by 2002:a63:8bc7:0:b0:3fc:b8ab:c612 with SMTP id
 j190-20020a638bc7000000b003fcb8abc612mr39306159pge.535.1654868013694; 
 Fri, 10 Jun 2022 06:33:33 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 ay17-20020a056a00301100b0051bdb735647sm15695500pfb.159.2022.06.10.06.33.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jun 2022 06:33:32 -0700 (PDT)
Message-ID: <54e05ae1-46b1-70e9-47fe-9ba9bc727a96@amsat.org>
Date: Fri, 10 Jun 2022 15:33:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v4 1/3] target/nios2: Eliminate nios2_semi_is_lseek
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220608023816.759426-1-richard.henderson@linaro.org>
 <20220608023816.759426-2-richard.henderson@linaro.org>
In-Reply-To: <20220608023816.759426-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 8/6/22 04:38, Richard Henderson wrote:
> Reorg nios2_semi_return_* to gdb_syscall_complete_cb.
> Use the 32-bit version normally, and the 64-bit version
> for HOSTED_LSEEK.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/nios2/nios2-semi.c | 59 +++++++++++++++------------------------
>   1 file changed, 23 insertions(+), 36 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>



