Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F0147611D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 19:53:55 +0100 (CET)
Received: from localhost ([::1]:40838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxZPW-0002n5-L0
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 13:53:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mxXqI-0004ux-Su
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 12:13:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mxXqG-0007F2-6d
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 12:13:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639588403;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Ho6C3mzkobyr0kkgBwGJf8ZVAFSV08hew1QHHDo/ey0=;
 b=Mz/tcLFzbp6YFzXGYsjUmJFagi9wLiIXPuj+hb+/hKYs3zQCA1wMPwkVSXaxK325huk12Z
 qmRV50iceaN56lNaxZV0RTYGbUoRidQIQtdj9eNdIVn7Oor13V5spo7EzuozQlOoQ+GR6U
 pWOkPnAwUFVYQE1tyX22rrCB9U7LD1U=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-421-3sSlA3idP9-0II8eLoU2EA-1; Wed, 15 Dec 2021 12:13:20 -0500
X-MC-Unique: 3sSlA3idP9-0II8eLoU2EA-1
Received: by mail-wr1-f72.google.com with SMTP id
 h12-20020adfa4cc000000b001a22dceda69so798026wrb.16
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 09:13:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=Ho6C3mzkobyr0kkgBwGJf8ZVAFSV08hew1QHHDo/ey0=;
 b=GaGjWboZiLz+m4p4wZ5/7OQSBAVO7mpaHrpGQf+DYDJ/eRfltSnvALfGQ12wUfWwbn
 bI7ICIEwP2tJX+YN7E4SblLLNBLR0DyQbgoVw/7C7Ev85tHoRk012qgrV/z03BR8xMhd
 yvEuqwuY+I+XLxzb2lIM+eJBmtMmoMXnspiyzWZ3N3W+p38W3JIDji0RF/f5YFYMUH6T
 Wf8akKD8stBh9TInmpQC1paE/cx6tinKNF8q4bbk9YKWKyA7JwxWKLDgfYeS1Uwet4Wn
 1dYZI/vs/A9K3KDewuAwmc4leAgXAQnyZw7AYpbIAnbapaX4GC2N8q7T+7E59podTWu9
 Q49w==
X-Gm-Message-State: AOAM532Bo4HA2qcgDInRNpgGN0MWKnMc1po4tbQ4Gkdk5vLptE59WIp8
 uqAtTyqN0R3VEROWORFG2mbzch6Fpqoi0TKKdAq/weOMS0fxuyKyNdktlel4xb/eTAqDrWTtxAD
 Jnh9RtxH3gMquZ6o=
X-Received: by 2002:a05:600c:1f0c:: with SMTP id
 bd12mr899467wmb.56.1639588399264; 
 Wed, 15 Dec 2021 09:13:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzs7YWwJVJzYCcqG8d9kG/EoBAg/PYqRzOYypBXzsmfyaVc0r7MdOinzhMjBxwlQ24eItCsGA==
X-Received: by 2002:a05:600c:1f0c:: with SMTP id
 bd12mr899401wmb.56.1639588398778; 
 Wed, 15 Dec 2021 09:13:18 -0800 (PST)
Received: from localhost (static-174-144-85-188.ipcom.comunitel.net.
 [188.85.144.174])
 by smtp.gmail.com with ESMTPSA id g18sm6848693wmq.4.2021.12.15.09.13.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 09:13:18 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hw: Add compat machines for 6.3
In-Reply-To: <CAFEAcA-94WxKObDZQn_XRaJ7SDBKvqgvqwPb3v3Uyg73rZepgQ@mail.gmail.com>
 (Peter Maydell's message of "Wed, 15 Dec 2021 17:09:01 +0000")
References: <20211215170548.20776-1-quintela@redhat.com>
 <CAFEAcA-94WxKObDZQn_XRaJ7SDBKvqgvqwPb3v3Uyg73rZepgQ@mail.gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Wed, 15 Dec 2021 18:13:17 +0100
Message-ID: <87tuf9yeoi.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: quintela@redhat.com
Cc: Eduardo Habkost <eduardo@habkost.net>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> wrote:
> On Wed, 15 Dec 2021 at 17:06, Juan Quintela <quintela@redhat.com> wrote:
>>
>> Add 6.2 machine types for arm/i440fx/q35/s390x/spapr.
>>
>> Shameless copy of commit
>>         52e64f5b1f2c81472b57dbad255ab9b00302f10d
>> from
>>         Yanan Wang <wangyanan55@huawei.com>
>
>> +DEFINE_VIRT_MACHINE_AS_LATEST(6, 3)
>
> There is no 6.3 -- the next release (being next year) will be 7.0.
> Cornelia's posted an update-machine-types patch:
> https://patchew.org/QEMU/20211208170241.110551-1-cohuck@redhat.com/

Hi

Didn't see it when I was doing this.

I got confused with the version number on the tree.

Sorry for the noise.

Later, Juan.


