Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7426B1BFD
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 08:10:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paAOu-0002kn-Hy; Thu, 09 Mar 2023 02:09:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1paAOs-0002kS-Ed
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 02:09:18 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1paAOq-0004Lj-E9
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 02:09:18 -0500
Received: by mail-wr1-x432.google.com with SMTP id j2so850296wrh.9
 for <qemu-devel@nongnu.org>; Wed, 08 Mar 2023 23:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678345753;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zcqxyCjn1HiKd25QvCqzufTu8m9bBHyuYm0QcUe5sxo=;
 b=J934DRmbmVFVxO3llc0N7G0GlYh4BdhOzQGxt0hQEx07nusKfbkhfDAn+tpgo4HFWK
 fXKESAIweb4h8rFn2Tphb0sr7jDuhr4XDICzg1Zbr+KzeLeCkXq2I+b+8aydMcQuzyAo
 Vf9N33FMdxNvtdzWIHAp4UFHZz5kUiNDQ8wZtNvt1GIGuGa1Z5USoq4jUEhuAxBXyvKu
 KDLZDtmmPEKCyZ6RfEkpRGfzeV2IMHlb4IwlYTL8WIRKtzR8W6GD7d75dB2evQwS3i3T
 pJ40+xKRZHjp5usO19pb27KpDR38NdR7Lx5SuKn52Z1Mss6uFUDvNJDa4EGz1qUOA+Pc
 g6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678345753;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zcqxyCjn1HiKd25QvCqzufTu8m9bBHyuYm0QcUe5sxo=;
 b=ZP/UmxCiMOCwUNilpMPY06PmPuexHx31JL4PutnX8veEuOW4UcbIuWtwIx32XErIUc
 aRAFXKlqJL9zcP51orPpYqm4oK1w1XPbZslykEA5VDJbia90QScN4ICrM1uFskvWTzmY
 lYMCVPlDrJTolIkICH8ZvGpXLM0g6LIDV+zMKqgTA1MSVWK8G64SbmDL/3rZ5hwdD6kD
 upbc9zIz3YT6h7/DOox85EgiOghi/QiICGFSv0nSihDOAoQYP5iabZ+vYPJ4Fu2E5oQR
 ktlg325CUXXWJ3+wDpoAn25RKPw5Hwfy1YYCZMLDzbk4nrk6zmfyrBXbxeib/FnZo5VP
 GTng==
X-Gm-Message-State: AO0yUKWciIl6RLjM3bgAUqi1sw5+vCchJLcmuVYa3IZ+O1cAIi4zeVBQ
 qjdZgfqkuJUC0pZ+0weJkX2hNQ==
X-Google-Smtp-Source: AK7set+z0Ts7y1QtuFOmsvVViuQUQuunSEjfOpwP1Zs4Td+cJrdeJMYFr7qt82i9ob4I/CBphrFzGA==
X-Received: by 2002:adf:fa4e:0:b0:2c9:d91b:a6ff with SMTP id
 y14-20020adffa4e000000b002c9d91ba6ffmr14763888wrr.21.1678345753685; 
 Wed, 08 Mar 2023 23:09:13 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 c16-20020a5d4cd0000000b002be0b1e556esm16917904wrt.59.2023.03.08.23.09.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Mar 2023 23:09:13 -0800 (PST)
Message-ID: <6d60991b-f9f6-0f2f-7da1-cf1cce61cb42@linaro.org>
Date: Thu, 9 Mar 2023 08:09:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] block: add missing coroutine_fn to
 bdrv_sum_allocated_file_size()
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>
References: <20230308211435.346375-1-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230308211435.346375-1-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 8/3/23 22:14, Stefan Hajnoczi wrote:
> Not a coroutine_fn, you say?
> 
>    static int64_t bdrv_sum_allocated_file_size(BlockDriverState *bs)
>    {
>        BdrvChild *child;
>        int64_t child_size, sum = 0;
> 
>        QLIST_FOREACH(child, &bs->children, next) {
>            if (child->role & (BDRV_CHILD_DATA | BDRV_CHILD_METADATA |
>                               BDRV_CHILD_FILTERED))
>            {
>                child_size = bdrv_co_get_allocated_file_size(child->bs);
>                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> Well what do we have here?!
> 
> I rest my case, your honor.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   block.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/block.c b/block.c
> index 0dd604d0f6..a79297f99b 100644
> --- a/block.c
> +++ b/block.c
> @@ -5749,7 +5749,7 @@ exit:
>    * sums the size of all data-bearing children.  (This excludes backing
>    * children.)
>    */
> -static int64_t bdrv_sum_allocated_file_size(BlockDriverState *bs)
> +static int64_t coroutine_fn bdrv_sum_allocated_file_size(BlockDriverState *bs)
>   {
>       BdrvChild *child;
>       int64_t child_size, sum = 0;

Since there is only 1 call site, maybe worth renaming as
bdrv_co_sum_allocated_file_size() in the same patch?

