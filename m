Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2195C6F558D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 12:05:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu9M5-00049o-0o; Wed, 03 May 2023 06:05:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu9M3-00049S-5T
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:04:59 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu9M1-0006lD-LX
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:04:58 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3063433fa66so1667824f8f.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 03:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683108296; x=1685700296;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JYNzn2Q4a7cKG35Lhc6n2fy+obWz9OuZwFxbqQtBscQ=;
 b=PuviWjia5EctAVyoAvadjOqTF4RqUq73SBYZJvOxF+3enEao+xnV6EULYlJeAf0BGh
 /7YyrwfyUCx2gAzM65oDkCqL9JNjoGE4L4bGYpAEd5/4ErItUA44oHAeWMNLIzXwghXG
 FH4FH6FM3FLRhwOEgt40RfooCO198sjs3voNXi45F5KigjTGobkElNXH9+qxLuEFtBNj
 KDRMvdR08KK0HY/WhD3u0UtQ+WbsAFdWwuXupuA8QH2yWMjM1i2TJfQtqcwRKI6wrRyc
 1Cg1pPsfY8B/YhDxFFF5d79uv0ehJ5YQKkmtoyKuk97xwlDpye1TdQRGxLhg+yaDym9h
 D4xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683108296; x=1685700296;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JYNzn2Q4a7cKG35Lhc6n2fy+obWz9OuZwFxbqQtBscQ=;
 b=T7A4K2TDVZ2x4+fkfeEbbL/JiyaZpEeVPAc29ctvCoIQPVpDQtMRBSMUb5zWR6FvhT
 bSq0DNJO7vbtrxTfsmuU+Dd618Loffv8o1EuPSzRqSkVtDBzAZHiRcGBvzW/7PbavXyr
 1+uQL/fl62MZP4pscYZaZPMMyDKmHEMZNraEmVmxxiLzc+unpFk/JTvtlan0kHZl8vEx
 hnq1Cd4Qwou5TqeUKLI+rudxmUCVkSZHhxbpF0XzGRKdhImBaTF6aT5UCkK2p9UTUZBt
 15/xG9JQ5Y2P/GmJ7WHnLYISJmdY/TgOFvwbnnzRikNX7LSUzl49gOWNUmMrrnFuRaPk
 avaQ==
X-Gm-Message-State: AC+VfDzzfkIge6SY+okxgD4euyrTv+FEQ2PkZGniXa/+VK56g87Nrc6Z
 kkddNFd27AYdWFI1P5wgmmdWfg==
X-Google-Smtp-Source: ACHHUZ6ipctsA9GhUFyTOWFiRlNB0dPCaMMOFndTVDiE9y8hgMpFnL1jijEJP7lFgEs2C3lBvGgOHQ==
X-Received: by 2002:a05:6000:11c5:b0:2f5:83a8:a9a9 with SMTP id
 i5-20020a05600011c500b002f583a8a9a9mr13575087wrx.16.1683108295846; 
 Wed, 03 May 2023 03:04:55 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:c01d:9d74:b630:9087?
 ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 e8-20020adfdbc8000000b003047d5b8817sm24303901wrj.80.2023.05.03.03.04.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 03:04:55 -0700 (PDT)
Message-ID: <e39f6040-17f6-a0a1-1f28-b923c5f2dfcc@linaro.org>
Date: Wed, 3 May 2023 11:04:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 09/10] hw/9pfs: use qemu_xxhash4
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230503091756.1453057-1-alex.bennee@linaro.org>
 <20230503091756.1453057-10-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230503091756.1453057-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/3/23 10:17, Alex Bennée wrote:
> No need to pass zeros as we have helpers that do that for us.
> 
> Message-Id:<20230420150009.1675181-10-alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> Reviewed-by: Christian Schoenebeck<qemu_oss@crudebyte.com>
> Reviewed-by: Stefan Hajnoczi<stefanha@redhat.com>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   hw/9pfs/9p.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

