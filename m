Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9072C33AECA
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 10:29:13 +0100 (CET)
Received: from localhost ([::1]:37200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLjXE-0007iN-0N
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 05:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLjLc-0001st-D0
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:17:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLjLa-0000Xc-RC
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:17:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615799830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WVhIQfgnxcFEBXXVb3a8T1tIbcV8las+uY2R3RnfbYM=;
 b=RvS3m1UQOlHCCuA0JDbifu9uTDsYe0xeymD5YRD3Ykn1OWTcjW5UqRCoQXDE1pRUEISxhC
 MHQSsPgwbKmKGcOpmLifR7EhHdYCIWfWstPk/wz6Sy8U3jyFSg1rrofPte5lV2K17OhO2I
 3iab1gkGHmgbqIBFrO0ZWeOhMYXDmFA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-xBpQYi0eMEyIAhDBjXkrQQ-1; Mon, 15 Mar 2021 05:17:09 -0400
X-MC-Unique: xBpQYi0eMEyIAhDBjXkrQQ-1
Received: by mail-wm1-f70.google.com with SMTP id n2so7918230wmi.2
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 02:17:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WVhIQfgnxcFEBXXVb3a8T1tIbcV8las+uY2R3RnfbYM=;
 b=PhkeCXFG/7qa/GYz31loFYa6pwgd97fXjF228TKJfUkLHswjPReHRQtg3aHOL2PCwI
 pI3CVNW7LJExZwDzMEVV40GmGTGZGmdPg/YLysKsfbhjHc5ngVGL0J4OP2o2qAkbUo0r
 JQAtlvR/EqINe3qgGf/WjAB0QX2shavC1NqWxDx1+I+KRj1eBGP3XYvK5GPoJOLTCgtk
 aBDgrSBlb+zv5vlG5THTsvWwSPI5bbVwpXwTEiiEnjcZ2iFqqyW1pyaZY/Uz1nTh1Zf2
 +dV1w/Fotv/TAWWjakcLtObmT+6riRTVn9tLd3tf7fihfiTp46zVvlMlqL6MozpcCOF0
 a4+A==
X-Gm-Message-State: AOAM532O5zNf4m9JVIPfQE7LQMF3Y11n/8lvHNwcGTfcq/XVBGrsS8VY
 5eZclhRiM8vk59A+Wmsc12AxdxAx0hS8zgefAmaxuhWiQY31GB7pyDbQx/HCi9XwMkVqjOl0ZaY
 AeAynLDWKNle8NaDQiGeHouCJSoexam9LSbthFLEAAohCRvn/un6G9UBPPU5sHBXR
X-Received: by 2002:a05:6000:10c3:: with SMTP id
 b3mr26002237wrx.96.1615799827571; 
 Mon, 15 Mar 2021 02:17:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz43L3zKQ72HUPH0ldUWYe7jLTzRzXh2QJTyypGT2SAmgq1ISCgtQxoQ7KnXZVlnkLHRpbdYA==
X-Received: by 2002:a05:6000:10c3:: with SMTP id
 b3mr26002213wrx.96.1615799827283; 
 Mon, 15 Mar 2021 02:17:07 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id a13sm15847418wrp.31.2021.03.15.02.17.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 02:17:06 -0700 (PDT)
Subject: Re: [PATCH v2 02/13] net: Add a 'do_not_pad" to NetClientState
To: Bin Meng <bmeng.cn@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210315075718.5402-1-bmeng.cn@gmail.com>
 <20210315075718.5402-3-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4093c094-ed8c-d8c4-09b7-4bad19529ec6@redhat.com>
Date: Mon, 15 Mar 2021 10:17:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210315075718.5402-3-bmeng.cn@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/21 8:57 AM, Bin Meng wrote:
> This adds a flag in NetClientState, so that a net client can tell
> its peer that the packets do not need to be padded to the minimum
> size of an Ethernet frame (60 bytes) before sending to it.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
> 
>  include/net/net.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/net/net.h b/include/net/net.h
> index 919facaad2..6fab1f83f5 100644
> --- a/include/net/net.h
> +++ b/include/net/net.h
> @@ -100,6 +100,7 @@ struct NetClientState {
>      int vring_enable;
>      int vnet_hdr_len;
>      bool is_netdev;
> +    bool do_not_pad;
>      QTAILQ_HEAD(, NetFilterState) filters;
>  };

This is a bit pointless without the next patch, why
not squash it there?


