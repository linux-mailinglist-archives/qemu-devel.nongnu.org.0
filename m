Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 527FB4903DC
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 09:30:40 +0100 (CET)
Received: from localhost ([::1]:33940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9NPS-0006qy-FG
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 03:30:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n9NGs-0007v2-7T
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 03:21:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n9NGq-0002Ro-PT
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 03:21:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642407703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F6mqVK2Tq1dQZvjQ3ptE5jSUjl876c/+ywGeJekheIg=;
 b=W+jjIyUPSlLmkItrXrXPQB1jOSDXcCLm1Xl4S7bk3MDTPdZ61iZzHQGcJC2ao/hIOIr72/
 pI7u9m4axN1FZdEUo98z2M4J47h1U/rEY9Vvc46WFleK1GCWL7uJMX5/6eA/LlbJbOYoMj
 Q6zdRg8FcEMuoKFOKczfGomEUafNfNQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-sIIHW40VM3SoEmBFtlpd5w-1; Mon, 17 Jan 2022 03:21:38 -0500
X-MC-Unique: sIIHW40VM3SoEmBFtlpd5w-1
Received: by mail-ed1-f70.google.com with SMTP id
 ee53-20020a056402293500b004022f34edcbso2810765edb.11
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 00:21:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=F6mqVK2Tq1dQZvjQ3ptE5jSUjl876c/+ywGeJekheIg=;
 b=UuT8h5aGGzDNq1+Hq7Z8oxPv4+YhLK134hN79HEFgcZWXLKSDRFx4HYme3MIyM5VjN
 H8k+f6vc5oehw9VU+Ot5qcsEw6H8sQAtOpdUG9tVLoHYpRQWVXjRt4mgD92n9ecem8++
 zi7C1Ur76p4gBWsmdOStDkCak0o1TB5IqcHq69GfjIgUlmFZmPa5Ybzu8YRL3nuWejXT
 LubiXtiVp+4WDaHMwX5bi4tnioLwViB7QHHM8bLZyJakn2SDXk+b7EnsDP7wFp6R/vQf
 mM7xLHWmpNTB8jbxcglN2WzcbMM/4KqiymROpPAuY+uYH5jSXVqIKvWKj/gDg7BunCpl
 J93g==
X-Gm-Message-State: AOAM5339ctStDgRJyLY3K19IP2q9xu/kyjAyDEmdB6mJRrjFGTghBcA/
 Gltcte1iqoXEmsAfFG8i5EnqKzqJc75yJMGbuPLzycOff/7dBG12I/vSwHUjkXy1dGYJCZlOm5M
 ufwG1ifVa41wky5s=
X-Received: by 2002:a05:6402:291a:: with SMTP id
 ee26mr13209376edb.236.1642407697577; 
 Mon, 17 Jan 2022 00:21:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxTwIHLcnVaSWkaFCRoaIzYtSZc74VD5bWxTereSFB2jOFV7b7D9T8eXb34u6adRjDnFTyPQw==
X-Received: by 2002:a05:6402:291a:: with SMTP id
 ee26mr13209362edb.236.1642407697380; 
 Mon, 17 Jan 2022 00:21:37 -0800 (PST)
Received: from ?IPV6:2003:cb:c705:dd00:68a1:1bd:6733:bde9?
 (p200300cbc705dd0068a101bd6733bde9.dip0.t-ipconnect.de.
 [2003:cb:c705:dd00:68a1:1bd:6733:bde9])
 by smtp.gmail.com with ESMTPSA id jg41sm4175148ejc.101.2022.01.17.00.21.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 00:21:36 -0800 (PST)
Message-ID: <5eac0540-fc45-0d17-7b69-143d37004d96@redhat.com>
Date: Mon, 17 Jan 2022 09:21:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 6/6] libvhost-user: handle removal of identical regions
To: Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "mst@redhat.com" <mst@redhat.com>
References: <20220117041050.19718-1-raphael.norwitz@nutanix.com>
 <20220117041050.19718-7-raphael.norwitz@nutanix.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220117041050.19718-7-raphael.norwitz@nutanix.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "raphael.s.norwitz@gmail.com" <raphael.s.norwitz@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.01.22 05:12, Raphael Norwitz wrote:
> Today if QEMU (or any other VMM) has sent multiple copies of the same
> region to a libvhost-user based backend and then attempts to remove the
> region, only one instance of the region will be removed, leaving stale
> copies of the region in dev->regions[].
> 
> This change resolves this by having vu_rem_mem_reg() iterate through all
> regions in dev->regions[] and delete all matching regions.
> 
> Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>

Reviewed-by: David Hildenbrand <david@redhat.com>


-- 
Thanks,

David / dhildenb


