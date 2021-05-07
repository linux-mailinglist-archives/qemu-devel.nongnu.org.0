Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 389133767A7
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 17:07:01 +0200 (CEST)
Received: from localhost ([::1]:59996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf24C-00051Y-A0
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 11:07:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lf1uu-0005jt-9T
 for qemu-devel@nongnu.org; Fri, 07 May 2021 10:57:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lf1ur-0008JK-ST
 for qemu-devel@nongnu.org; Fri, 07 May 2021 10:57:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620399440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d0GpYguGvmotRnNwEDh6iAOSU3f9Ji/CbxQP0MKpGsI=;
 b=ZBIMHX4YWNKSYMea3zXO6BrQvZuRSBtXw4O5kPahCI1pn++2D+rDzO+eeJ9sZr3jDp25b8
 i07c217WTq86ZMKaoBZpPP0doWg3qnB4gpxAIWANSU5z+/FAlug9n/Qulw+QBvaNAzbSls
 5gtYF3ij2aYdkKbzmjLe9CsLazgH+Jw=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-pgIZQAG2M32JN4op0-kLsQ-1; Fri, 07 May 2021 10:57:18 -0400
X-MC-Unique: pgIZQAG2M32JN4op0-kLsQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 y24-20020a0ca9180000b02901d367101f9dso6835874qva.1
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 07:57:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=d0GpYguGvmotRnNwEDh6iAOSU3f9Ji/CbxQP0MKpGsI=;
 b=GZAl6NvXMty6t4VxCKXd3vHlp1rV21B6oPagPo3Tbu8Kpl3aOE3bHSNykacTwEMqVa
 nAsn8Khd/qyQSoTXWDiHPej97EfoPRfGevjKjzOZcEHCyTGz/yrAsjMME5dmCrelaQwy
 2uYIeaSnUqEDWsIrYWPwbd6FxcAMrp9Bv8em07XUyFz2z9zjuSvsHAoZmqvsT59i4Hsn
 s6HU8pOayGUXvSg7qMJdfkpaXp7Eyr2Q8vUcpCnvrLBNHd4Wsb8SJ7qudupG7Tnj2buV
 9b4J1JMm4NK2PtZmxen97FU5be3w8l+Uqp7hyfvQJDCvOxDiWt40iFNVNhT8antV037C
 1IvQ==
X-Gm-Message-State: AOAM53130tRpg5mYnQq7FnuEoIXAjhmuwdGtXTCZ2ThKAH8PdcPjjZef
 GpJSBYZLhGQvVhc0HUss0EyGsyaNLJuw4BJDVplsjx5GwYaDomxOu3Jva7/FZ962L8jhttb3tik
 PR/AEjbpNiy+5a9g=
X-Received: by 2002:a05:620a:2912:: with SMTP id
 m18mr10347532qkp.475.1620399438044; 
 Fri, 07 May 2021 07:57:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkqKjFZoiWVCoz80Hjatbw+vCy925ULPGZe9lCdeEeeafUf0JQqH6XPO9In9tB3Is5p7hhlA==
X-Received: by 2002:a05:620a:2912:: with SMTP id
 m18mr10347507qkp.475.1620399437796; 
 Fri, 07 May 2021 07:57:17 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca.
 [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id g140sm3662918qke.32.2021.05.07.07.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 07:57:16 -0700 (PDT)
Date: Fri, 7 May 2021 10:57:15 -0400
From: Peter Xu <peterx@redhat.com>
To: Kunkun Jiang <jiangkunkun@huawei.com>
Subject: Re: [question] The source cannot recover, if the destination fails
 in the last round of live migration
Message-ID: <YJVVS3K3TW8RwfuS@t490s>
References: <7d87a3b7-86c9-9248-59dc-e1612a00e7c3@huawei.com>
 <YJPpr0z+sV3lQMxZ@work-vm>
 <dd990878-fb0f-5bfc-f390-d6807b158372@huawei.com>
MIME-Version: 1.0
In-Reply-To: <dd990878-fb0f-5bfc-f390-d6807b158372@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>, David Edmondson <dme@dme.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 07, 2021 at 05:46:44PM +0800, Kunkun Jiang wrote:
> Hi Dave,
> 
> On 2021/5/6 21:05, Dr. David Alan Gilbert wrote:
> > * Kunkun Jiang (jiangkunkun@huawei.com) wrote:
> > > Hi all,
> > Hi,
> > 
> > > Recently I am learning about the part of live migration.
> > > I have a question about the last round.
> > > 
> > > When the pending_size is less than the threshold, it will enter
> > > the last round and call migration_completion(). It will stop the
> > > source and sent the remaining dirty pages and devices' status
> > > information to the destination. The destination will load these
> > > information and start the VM.
> > > 
> > > If there is an error at the destination at this time, it will exit
> > > directly, and the source will not be able to detect the error
> > > and recover. Because the source will not call
> > > migration_detect_error().
> > > 
> > > Is my understanding correct?
> > > Should the source wait the result of the last round of destination ?
> > Try setting the 'return-path' migration capability on both the source
> > and destination;  I think it's that option will cause the destination to
> > send an OK/error at the end and the source to wait for it.
> Thank you for your reply!
> The 'return-path' migration capability solved my question. 😁
> 
> But why not set it as the default? In my opinion, it is a basic ability
> of live migration. We need it to judge whether the last round of the
> destination is successful in the way of 'precopy'.

I think it should be enabled as long as both sides support it; though may not
be suitable as default (at least in QEMU) so as to consider old binaries.

Thanks,

-- 
Peter Xu


