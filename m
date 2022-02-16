Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A234B84FB
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 10:56:27 +0100 (CET)
Received: from localhost ([::1]:55802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKH2w-0000Kf-HY
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 04:56:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nKGLf-00018B-1X
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 04:11:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nKGLb-0006Hq-OK
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 04:11:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645002698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4T+RwdCKa1H5uei1/PEUZdbRuWBIRBreh/HZYlUT69s=;
 b=hBNmCUJ6okBRXyvet57I5r3ldi9XkjNvLQLEWwHVN53/BhCGaht8YM7axt5+HyNDB8F0/C
 MvRxfRUFElad2vxLLVYkW8Y8/0dCNygauf/VFmIpo84JHXQjaSPUYDA3/Q0kdBnAgaVOQf
 BcuRni3RcvOhB5iP3cyhvDfNw+Mk3T8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-339-J9vG9GwEPP2-6Vsr8VK42Q-1; Wed, 16 Feb 2022 04:11:37 -0500
X-MC-Unique: J9vG9GwEPP2-6Vsr8VK42Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 u14-20020a05600c210e00b0037bddd0562eso233836wml.1
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 01:11:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4T+RwdCKa1H5uei1/PEUZdbRuWBIRBreh/HZYlUT69s=;
 b=xQ86G+zbjNJqXEbKHJHYWQx4SQ7jDfLxeIdZcZEs+JgCnr//GL+o2IWRKG8eHg6hKl
 1WRiCJYu86pU0k/LFkzZRof05IWbblVCgGGJSWJTgzRnOk8eHedfBIplLlgEE+WLJZSa
 +RGAy8hHz17WE4gJxU+rqAHyt/Ys9+Ie2glcoyjOkO6AwIDD4aLxsIV4+DnXciQwdpn3
 fV0bj5yCOH2NVPidpINZYymvMWZyvBLcTJYLuv8Xmduqd10/FE9onj0q1Ysv5ZjDceZO
 uHceh/UschuoXGAxxOWqbhFgiA0Dkayn6w2X2IMAPJdOIqcSNI4SPLBqY0WU/lYAI+Md
 uuYw==
X-Gm-Message-State: AOAM532N6I8TH8D4O4cygeU6mdBZXGMPAhbYb26sEhTwwnGFKbn7Q+gG
 +cdvVNGIGxfDVGOOlYq6u/EmwprkLFqdgdsno+w8fd8wgrLtlOmWCmWjH9xJsDUEVUfO9glXGLL
 kIkfshtsk1mjdAe0=
X-Received: by 2002:adf:cc86:0:b0:1e4:b25d:cfc5 with SMTP id
 p6-20020adfcc86000000b001e4b25dcfc5mr1543236wrj.7.1645002695823; 
 Wed, 16 Feb 2022 01:11:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJygTOmjvvUaWGVdMTZOK3vlQC7Fy9C4gzKlLwnc8oSgP/za3wG3IT2dkLsygTe1eUCXd4n7rQ==
X-Received: by 2002:adf:cc86:0:b0:1e4:b25d:cfc5 with SMTP id
 p6-20020adfcc86000000b001e4b25dcfc5mr1543227wrj.7.1645002695643; 
 Wed, 16 Feb 2022 01:11:35 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id c18sm29649597wro.81.2022.02.16.01.11.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 01:11:35 -0800 (PST)
Message-ID: <82d00de9-3784-161d-bb3e-a36940fd9396@redhat.com>
Date: Wed, 16 Feb 2022 10:11:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v1 4/4] hw: hyperv: Initial commit for Synthetic Debugging
 device
To: Jon Doron <arilou@gmail.com>, qemu-devel@nongnu.org
References: <20220204100723.406121-1-arilou@gmail.com>
 <20220204100723.406121-5-arilou@gmail.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <20220204100723.406121-5-arilou@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, vkuznets@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


> +
> +static uint16_t handle_recv_msg(HvSynDbg *syndbg, uint64_t outgpa,
> +                                uint32_t count, bool is_raw, uint32_t options,
> +                                uint64_t timeout, uint32_t *retrieved_count)
> +{
> +    uint16_t ret;
> +    uint8_t data_buf[TARGET_PAGE_SIZE - UDP_PKT_HEADER_SIZE];
> +    hwaddr out_len;
> +    void *out_data = NULL;
> +    ssize_t recv_byte_count;
> +
> +    /* TODO: Handle options and timeout */
> +    (void)options;
> +    (void)timeout;
> +
> +    if (!syndbg->has_data_pending) {
> +        recv_byte_count = 0;
> +    } else {
> +        recv_byte_count = qemu_recv(syndbg->socket, data_buf,
> +                                    MIN(sizeof(data_buf), count), MSG_WAITALL);
> +        if (recv_byte_count == -1) {
> +            ret = HV_STATUS_INVALID_PARAMETER;
> +            goto cleanup;
> +        }
> +    }
> +
> +    if (!recv_byte_count) {
> +        *retrieved_count = 0;
> +        ret = HV_STATUS_NO_DATA;
> +        goto cleanup;
> +    }
> +
> +    set_pending_state(syndbg, false);
> +
> +    out_len = recv_byte_count;
> +    if (is_raw) {
> +        out_len += UDP_PKT_HEADER_SIZE;
> +    }
> +    out_data = cpu_physical_memory_map(outgpa, &out_len, 1);
> +    if (!out_data) {
> +        ret = HV_STATUS_INSUFFICIENT_MEMORY;
> +        goto cleanup;
> +    }
> +
> +    if (is_raw &&
> +        !create_udp_pkt(syndbg, out_data,
> +                        recv_byte_count + UDP_PKT_HEADER_SIZE,
> +                        data_buf, recv_byte_count)) {
> +        ret = HV_STATUS_INSUFFICIENT_MEMORY;
> +        goto cleanup;
> +    } else if (!is_raw) {
> +        memcpy(out_data, data_buf, recv_byte_count);
> +    }
> +
> +    *retrieved_count = recv_byte_count;
> +    if (is_raw) {
> +        *retrieved_count += UDP_PKT_HEADER_SIZE;
> +    }
> +    ret = HV_STATUS_SUCCESS;
> +cleanup:
> +    if (out_data) {
> +        cpu_physical_memory_unmap(out_data, out_len, 1, out_len);
> +    }

Same nitpick as done in patch 1, I think you can use more gotos labels
instead of adding if statements.

> +
> +    return ret;
> +}
> +


