Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9F04B861F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 11:46:10 +0100 (CET)
Received: from localhost ([::1]:45488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKHp3-00045h-Qv
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 05:46:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arilou@gmail.com>) id 1nKHY0-0004M9-Fj
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 05:28:32 -0500
Received: from [2a00:1450:4864:20::334] (port=33574
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <arilou@gmail.com>) id 1nKHXy-0005dY-W7
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 05:28:32 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 y6-20020a7bc186000000b0037bdc5a531eso2506717wmi.0
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 02:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=T5gj0S/SjYpjzRiDLtr3YzD9Hb5PYaTL91rCkqV4AMI=;
 b=aem9YX8hFrbp3A89f5173r5naZCB2y2HoTy6h+3B9i5EUep9h10MKKedOUjwgcoKA+
 gcgf5jc/3VEUhrYpbCsCYYQB+0uDUwfC4xNaf2J32ukO5Q7iIW50T76D4rY0uFxVvPRT
 AuzkSzZjpCeLQ4nxKs08C6MvGpgT3l5S8IGFBxtJ3kTXy0q5DVOHv6OpgEv23qVEo4nK
 Sivx36TgZG2ldPEMoH8SnNcqj7ep0U10s4T/pBYAASRnHcjgGq3BQGWTwv3HOM7XhuS7
 xLbBrGrnmkVYfoatqJMu2eU7ZWPHVBiWGhQ16uSbOy7cIPbmjol0Wilvf7/pg3VwIQsj
 K4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=T5gj0S/SjYpjzRiDLtr3YzD9Hb5PYaTL91rCkqV4AMI=;
 b=LlsGkNn/xlWkyp8Tq8ras39f7F4qqgUbShlVNLR9sFYjKyGbNJV1RqiHlSFG/gkTjl
 9KFRbA8MpUcUANyZFb9mBYuEbSW/6ueDWWBa6kdpT1CzuwOc1oiCmDjHlpxK7lmwTjPU
 Sbl8RvtzNFG0+v0dPbMAuqVcUA2BD6q8aVdvMN8E7X5AuAkBLqm8XYEAMjYULzgOz91/
 Pzu/oC21VyGOQ6kCGtF9FIcYCACHhYbXnBWyT+/9uW0eEMimvYqOrmw1P+qm3CGY5+KA
 zVgIj8HNTyjlJgB/R9VncKjC2FKoYOeMoNgI1KbjMRl1RtBvonklKADUmM9i1pR2Y3Zm
 3ZLQ==
X-Gm-Message-State: AOAM533/zudvrC0UlpNavUFgClH5gr2GcagplQKZFd19GftJ1BtGFlmg
 aacIgCTuHM2hN5uwdm50U70LDRhQpYE=
X-Google-Smtp-Source: ABdhPJzn/g0WH1buIUPgv3dHR5soMJAx0By3qZKGg1Jj8wdDK2feQk3HFv86paxBAAKUJT9CINf4Pg==
X-Received: by 2002:a05:600c:212:b0:37c:919b:3eba with SMTP id
 18-20020a05600c021200b0037c919b3ebamr924233wmi.119.1645007309757; 
 Wed, 16 Feb 2022 02:28:29 -0800 (PST)
Received: from jondnuc ([2a0d:6fc2:4af1:7d00:5e41:a6ea:ffaa:548c])
 by smtp.gmail.com with ESMTPSA id p7sm10803492wrr.95.2022.02.16.02.28.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 02:28:29 -0800 (PST)
Date: Wed, 16 Feb 2022 12:28:27 +0200
From: Jon Doron <arilou@gmail.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v1 4/4] hw: hyperv: Initial commit for Synthetic
 Debugging device
Message-ID: <YgzRywoqNvCI759G@jondnuc>
References: <20220204100723.406121-1-arilou@gmail.com>
 <20220204100723.406121-5-arilou@gmail.com>
 <82d00de9-3784-161d-bb3e-a36940fd9396@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <82d00de9-3784-161d-bb3e-a36940fd9396@redhat.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=arilou@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: pbonzini@redhat.com, vkuznets@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/02/2022, Emanuele Giuseppe Esposito wrote:
>
>> +
>> +static uint16_t handle_recv_msg(HvSynDbg *syndbg, uint64_t outgpa,
>> +                                uint32_t count, bool is_raw, uint32_t options,
>> +                                uint64_t timeout, uint32_t *retrieved_count)
>> +{
>> +    uint16_t ret;
>> +    uint8_t data_buf[TARGET_PAGE_SIZE - UDP_PKT_HEADER_SIZE];
>> +    hwaddr out_len;
>> +    void *out_data = NULL;
>> +    ssize_t recv_byte_count;
>> +
>> +    /* TODO: Handle options and timeout */
>> +    (void)options;
>> +    (void)timeout;
>> +
>> +    if (!syndbg->has_data_pending) {
>> +        recv_byte_count = 0;
>> +    } else {
>> +        recv_byte_count = qemu_recv(syndbg->socket, data_buf,
>> +                                    MIN(sizeof(data_buf), count), MSG_WAITALL);
>> +        if (recv_byte_count == -1) {
>> +            ret = HV_STATUS_INVALID_PARAMETER;
>> +            goto cleanup;
>> +        }
>> +    }
>> +
>> +    if (!recv_byte_count) {
>> +        *retrieved_count = 0;
>> +        ret = HV_STATUS_NO_DATA;
>> +        goto cleanup;
>> +    }
>> +
>> +    set_pending_state(syndbg, false);
>> +
>> +    out_len = recv_byte_count;
>> +    if (is_raw) {
>> +        out_len += UDP_PKT_HEADER_SIZE;
>> +    }
>> +    out_data = cpu_physical_memory_map(outgpa, &out_len, 1);
>> +    if (!out_data) {
>> +        ret = HV_STATUS_INSUFFICIENT_MEMORY;
>> +        goto cleanup;
>> +    }
>> +
>> +    if (is_raw &&
>> +        !create_udp_pkt(syndbg, out_data,
>> +                        recv_byte_count + UDP_PKT_HEADER_SIZE,
>> +                        data_buf, recv_byte_count)) {
>> +        ret = HV_STATUS_INSUFFICIENT_MEMORY;
>> +        goto cleanup;
>> +    } else if (!is_raw) {
>> +        memcpy(out_data, data_buf, recv_byte_count);
>> +    }
>> +
>> +    *retrieved_count = recv_byte_count;
>> +    if (is_raw) {
>> +        *retrieved_count += UDP_PKT_HEADER_SIZE;
>> +    }
>> +    ret = HV_STATUS_SUCCESS;
>> +cleanup:
>> +    if (out_data) {
>> +        cpu_physical_memory_unmap(out_data, out_len, 1, out_len);
>> +    }
>
>Same nitpick as done in patch 1, I think you can use more gotos labels
>instead of adding if statements.
>
Done
>> +
>> +    return ret;
>> +}
>> +
>

