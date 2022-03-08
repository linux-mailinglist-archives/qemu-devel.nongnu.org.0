Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5FD4D1471
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 11:11:47 +0100 (CET)
Received: from localhost ([::1]:53168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRWok-0001eD-A8
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 05:11:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nRWmO-0000F5-6J
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 05:09:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nRWmM-0007ue-MC
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 05:09:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646734158;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SMMKVDiBDyJwSO1Zu2AyeyXXTjJwZLcialC0NLO89PM=;
 b=dpjyN6WbSAYeVSPF/pDF+zU1zxHHFXCjIjKxe4Dc8JJ1xlo/AQG0WbT1JSBpa1mvoOx5Zo
 gs/DkpPrtHJLZ+Kgx+aUCE7TFv9noDrnGObHq9kq6UFa7gkR9ZtAvnew3b6b1V9iR6zbH4
 qxTMCTCH//iuNjugTPZI+OkjYiD8nYM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-sRAoTRHjOauQ6GqxzN4_aQ-1; Tue, 08 Mar 2022 05:09:17 -0500
X-MC-Unique: sRAoTRHjOauQ6GqxzN4_aQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 l13-20020a7bcf0d000000b0038982c6bf8fso896690wmg.7
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 02:09:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=SMMKVDiBDyJwSO1Zu2AyeyXXTjJwZLcialC0NLO89PM=;
 b=BkW+j5bsZk1KpZowM3bsHwWeEK4QXM9nRPvEdfy7QEgqBpXeElXecxB1+cnC7ZFTvv
 fFMLgR88T7Y9uWqkKo4I+ggDtZf/4ANrfuGsZR2FC+A9T6vvG0zReTBk9frd+B5YU9X+
 ngrkCXFRhQoPAoJpUVV8sunqBAiGEm0LAJaPGMI82y0dQHRXQaC084dKh1HQ4DMYmKpF
 3wqLzS2vmPRs/cOPf1Er2G+WPq0f2E8gWdHbXg98rShPcvDhDrDOgqyc2vhBR2BjVu37
 VNvt9OOSJJHpRWfPFQzgRMKA6eCGI1Vuqkt7bmd+DzBr4xW9jmv7ZLgIj/SVnMt4paSO
 3Rzw==
X-Gm-Message-State: AOAM531MjyuPr6sQaErFJ8uEU5PPFzk8Hox3f0KkIriN1row5+p+/jT8
 35hR/DlvOypMzWOCHj16TLiHZ6HsTg4SmOgD5NP30xmXdojMpVKPYRMYljN0zvhxW3bIJuWgpy7
 WCBL8B3SPBe8+x9M=
X-Received: by 2002:a05:6000:90:b0:1f1:e485:8d55 with SMTP id
 m16-20020a056000009000b001f1e4858d55mr10188406wrx.178.1646734155778; 
 Tue, 08 Mar 2022 02:09:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxJkNvLvGarg4ll6R9+RqMebPZxKyrsEiCLdsblZFilJU2D2T48V3mOms72dN7rib8hT6GaAw==
X-Received: by 2002:a05:6000:90:b0:1f1:e485:8d55 with SMTP id
 m16-20020a056000009000b001f1e4858d55mr10188377wrx.178.1646734155459; 
 Tue, 08 Mar 2022 02:09:15 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 p26-20020a1c741a000000b00389ab9a53c8sm1794105wmc.36.2022.03.08.02.09.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 02:09:15 -0800 (PST)
Subject: Re: [PATCH v4 3/4] tests/qtest/vhost-user-blk-test: Temporary hack to
 get tests passing on aarch64
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20220307211439.213133-1-eric.auger@redhat.com>
 <20220307211439.213133-4-eric.auger@redhat.com>
 <YicprIn75glZ0zYe@stefanha-x1.localdomain>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <d85bd084-2856-87d6-3b98-148b2a7fa03a@redhat.com>
Date: Tue, 8 Mar 2022 11:09:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YicprIn75glZ0zYe@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: eric.auger@redhat.com
Cc: eesposit@redhat.com, jean-philippe@linaro.org, mst@redhat.com,
 qemu-devel@nongnu.org, Coiby.Xu@gmail.com, qemu-arm@nongnu.org, clg@kaod.org,
 pbonzini@redhat.com, eric.auger.pro@gmail.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Stefan,

On 3/8/22 11:02 AM, Stefan Hajnoczi wrote:
> On Mon, Mar 07, 2022 at 10:14:38PM +0100, Eric Auger wrote:
>> When run on ARM, basic and indirect tests currently fail with the
>> following error:
>>
>> ERROR:../tests/qtest/libqos/virtio.c:224:qvirtio_wait_used_elem:
>> assertion failed (got_desc_idx == desc_idx): (50331648 == 0)
>> Bail out! ERROR:../tests/qtest/libqos/virtio.c:224: qvirtio_wait_used_elem:
>> assertion failed (got_desc_idx == desc_idx): (50331648 == 0)
>>
>> I noticed it worked when I set up MSI and I further reduced the
>> code to a simple guest_alloc() that removes the error. At the moment
>> I am not able to identify where ths issue is and this blocks the
>> whole pci/aarch64 enablement.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  tests/qtest/vhost-user-blk-test.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
> What is the plan to identify the root cause?
To be honest, I have no precise plan yet. However I commit to work on it
within the next weeks.

If maintainers prefer to delay the introduction of qtest libqos
pci/aarch64 tests until this gets fixed, I would understand though.

Eric
>
> Acked-by: Stefan Hajnoczi <stefanha@redhat.com>


