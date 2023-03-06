Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C836ABD9D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 12:02:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ8bc-0003tQ-Ov; Mon, 06 Mar 2023 06:02:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pZ8bM-0003dz-Qz
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 06:02:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pZ8bE-0002y1-W3
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 06:01:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678100507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JrEPOB3daZ9V5UyULKt6x+nubfRuUD00AoA5pD+EKs0=;
 b=BMm94PQ/tc+cVHM1kHohK2gsKnEwl3UUa5vQ4SbcMNmD2Qa6ASWxT1O6e1wCFAS9mP2JnH
 blnLBp3fvy9co8L+p4ZfNj2M0q+3fJr/UB3Z6JiMjBsqfY1VpfVO4ycWuadYNFsCKHP8h+
 S8ktvrR73GoJBATccGBxOLg3XV8/W/E=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-79-StD-tqTlM8-VfIsDZvXGUQ-1; Mon, 06 Mar 2023 06:01:45 -0500
X-MC-Unique: StD-tqTlM8-VfIsDZvXGUQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 o3-20020a5d6483000000b002cc4fe0f7fcso1369052wri.7
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 03:01:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678100504;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JrEPOB3daZ9V5UyULKt6x+nubfRuUD00AoA5pD+EKs0=;
 b=Rj1t0eQFd73gT1ONdfiB8Gxc2faNbr63nXuPL6STzwND9GqHc7D8VEYAzQvU/ymdEF
 sNJJJGcmDL1Lmj+GOhxgC7zVlCSp8fUWo7ONAB+veslxPx7Y+tNMyvHeS8fpLSCaN/tz
 kUVjxFy1gxnXUOd1SDtTaV9rRcEV/hBUer2FpSierrKB99C4zaCbwIPpbRjaNfJUK0tW
 tPfu6RtRPOJE+1Oog5Tdpt79eO50IDy0WP0caUN9ogVuqj/W6zKrm2Yx00x8Bnh8jrui
 /M9FHLE6ZonSWpQNfHq6pq3beg+kwOrB9Ioo+L4FlFAcqkcwsI16UdTFSXttJt67Jo+d
 +Uwg==
X-Gm-Message-State: AO0yUKV00CZhNTnuowNFTKD1+HFthad9w99ZS64zQ//tdieh2T7NzVCZ
 prnEXYiKKa6TZsyZ12NY6Zdz9oeGzPt4PVNKAiOAn9+JQmotyjT2NHzCPy0YTFEaKl05Kk3KtuS
 D4DthckbsV7EFoIqsPV8936s=
X-Received: by 2002:a5d:55c7:0:b0:2c7:a55:bef7 with SMTP id
 i7-20020a5d55c7000000b002c70a55bef7mr7122889wrw.61.1678100504712; 
 Mon, 06 Mar 2023 03:01:44 -0800 (PST)
X-Google-Smtp-Source: AK7set+QegbfkUTcSzFN2w1WZ9UgOP1EZJAH1FUKIxR+xa8y3h6J8ksh54te/yNuAe8GkxiTJJ2K8w==
X-Received: by 2002:a5d:55c7:0:b0:2c7:a55:bef7 with SMTP id
 i7-20020a5d55c7000000b002c70a55bef7mr7122879wrw.61.1678100504383; 
 Mon, 06 Mar 2023 03:01:44 -0800 (PST)
Received: from ?IPV6:2003:cb:c704:3500:b8a3:191c:eae:cc05?
 (p200300cbc7043500b8a3191c0eaecc05.dip0.t-ipconnect.de.
 [2003:cb:c704:3500:b8a3:191c:eae:cc05])
 by smtp.gmail.com with ESMTPSA id
 r4-20020a5d4944000000b002c56013c07fsm9400195wrs.109.2023.03.06.03.01.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 03:01:43 -0800 (PST)
Message-ID: <ab3daceb-bf47-ec11-e4e3-a0d0758122ec@redhat.com>
Date: Mon, 6 Mar 2023 12:01:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 16/20] target/s390x: Remove assert vs g_in2
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org
References: <20230304181900.1097116-1-richard.henderson@linaro.org>
 <20230304181900.1097116-17-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230304181900.1097116-17-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
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

On 04.03.23 19:18, Richard Henderson wrote:
> These were trying to determine if o->in2 was available for
> use as a temporary.  It's better to just allocate a new one.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Ilya Leoshkevich <iii@linux.ibm.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: qemu-s390x@nongnu.org
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


