Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C03376CBE36
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 13:56:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph7vc-0002yw-BX; Tue, 28 Mar 2023 07:55:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ph7vY-0002yg-WD
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 07:55:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ph7vX-0007Wj-DP
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 07:55:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680004546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zMEPTUmxY/3wDCaURcZVq+sHAev+aqaoIAIHaTPPj+w=;
 b=hcAKgemt5+Crf8FNIvYAl+MwhMPFCJy/adNW0EI4iycBpBZPqQ+S+pQS5tbjKuZhp+zsll
 6UgcnUBAkqRMbve5wD3hRErlCozHe6YXSWHeiHGBzz6AYoJrz71VuV2IvzR/mSl4pU0Ljx
 OQFHzhyHHlKFF8n0xIA15uteofGhGio=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-390-JfyaBDcjMAqCQRN78MRndg-1; Tue, 28 Mar 2023 07:55:44 -0400
X-MC-Unique: JfyaBDcjMAqCQRN78MRndg-1
Received: by mail-qk1-f200.google.com with SMTP id
 187-20020a3707c4000000b007468d9a30faso5489146qkh.23
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 04:55:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680004544;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zMEPTUmxY/3wDCaURcZVq+sHAev+aqaoIAIHaTPPj+w=;
 b=LdUL2DSIn746nloNHOyzC9fyL+CWzGYqdMipZsHw9p6MS0IBrVoBPaShMA7nBgw2XQ
 EDeqo8FTZ/p3jcZCkZYS9jSp6I39Q+3FgoVfC8NyXdnMJl/GLBLiw7hPCbZTYx4WmGTR
 IL6WxFfMyBZJzaSFRFCo8FjJJFqaodwVuxD3R/s9YshhR8btKQR6icdcNQxLq122Xdlv
 oFBZJwEVodvHhzODw5bAYQBqcAB4K5HBY07IP/iHFHUB3tU/mJxpzSXbJujUd/ZZjulz
 HgAIYJsJIrD5PyzwBqk2TR7itv8pawlezxol3nK20zhWwWAOp3g7rQ+WCmv5qFXpWBBt
 3HlQ==
X-Gm-Message-State: AAQBX9cHGxn3fD3NmSuxRVJEuQ6XHxIXsgSl392qsBm0nw70nUqWOj+p
 iKgLzLK4/hXIhjmlbGVB33uUZaZ+5hwFcdPH6IbIkKzF8/HBDnC5F4oX0A6Er40Me9KhCNEiy50
 L9AJvWDYvjZyz56FntvW74yLIkw==
X-Received: by 2002:a05:622a:1819:b0:3b6:2e12:4d25 with SMTP id
 t25-20020a05622a181900b003b62e124d25mr26567460qtc.31.1680004544348; 
 Tue, 28 Mar 2023 04:55:44 -0700 (PDT)
X-Google-Smtp-Source: AK7set9KPSNmI4IA1iBmHMbBkFDufFHHo78bNqj54OCI96gUqN8N+Q8BE6mFG2f3mOjXmU1cXq4Rwg==
X-Received: by 2002:a05:622a:1819:b0:3b6:2e12:4d25 with SMTP id
 t25-20020a05622a181900b003b62e124d25mr26567438qtc.31.1680004544085; 
 Tue, 28 Mar 2023 04:55:44 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-113.web.vodafone.de.
 [109.43.179.113]) by smtp.gmail.com with ESMTPSA id
 t9-20020ac86a09000000b003e393c9feb7sm4425022qtr.58.2023.03.28.04.55.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 04:55:43 -0700 (PDT)
Message-ID: <bdebe626-e552-affb-b756-02c70898bdd6@redhat.com>
Date: Tue, 28 Mar 2023 13:55:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: stat64 wrong on sparc64 user
Content-Language: en-US
To: Luca Bonissi <qemu@bonslack.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
References: <db07e036-cc5f-c9ad-b63c-10fdd5404830@bonslack.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <db07e036-cc5f-c9ad-b63c-10fdd5404830@bonslack.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 28/03/2023 13.48, Luca Bonissi wrote:
> On qemu-sparc64 (userspace) the struct "target_stat64" is not correctly 
> padded, so the field st_rdev is not correctly aligned and will report wrong 
> major/minor (e.g. for /dev/zero it reports 0,0x10500000 instead of 1,5).
> 
> Here patch to solve the issue (it also fixes incorrect size on some fields):
> 
> --- qemu-20230327/linux-user/syscall_defs.h    2023-03-27 15:41:42.000000000 
> +0200
> +++ qemu-20230327/linux-user/syscall_defs.h.new    2023-03-27 
> 21:43:25.615115126 +0200
> @@ -1450,7 +1450,7 @@ struct target_stat {
>       unsigned int    st_dev;
>       abi_ulong    st_ino;
>       unsigned int    st_mode;
> -    unsigned int    st_nlink;
> +    short int    st_nlink;
>       unsigned int    st_uid;

That looks wrong at a first glance. IIRC Sparc is a very strictly aligned 
architecture, so if the previous field "st_mode" was aligned to a 4-byte 
boundary, the "st_uid" field now would not be aligned anymore... are you 
sure about this change? Maybe it needs a padding field now?

  Thomas


