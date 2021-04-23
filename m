Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA77368CE7
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 08:02:34 +0200 (CEST)
Received: from localhost ([::1]:37830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZotd-0006H6-3x
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 02:02:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lZosZ-0005s5-7Z
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 02:01:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lZosW-00014k-PQ
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 02:01:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619157683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GwMsjDTvUN+jg/2/bgxzzW7kOAf2Xv+zcvPPVUAgAjE=;
 b=MawBwXBryUOQFnv4ssntr4xwWBVzJ4GW93m6zUERVLc17OXwIWIKM43wK8cdL6dgeyXuUO
 xkHJji4/EiLHtAlxudo98vUOkAusFVCETdRwJqQniAFuLZbZGrYvr7iERTZqwbGWvMlOlg
 1A3lS7jFgErXht75urQPNw46YfmvP7I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-TyKGTc6ZNnSmxw32D-HmGw-1; Fri, 23 Apr 2021 02:01:18 -0400
X-MC-Unique: TyKGTc6ZNnSmxw32D-HmGw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A246110C40C0;
 Fri, 23 Apr 2021 06:01:17 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-225.pek2.redhat.com
 [10.72.13.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 699D61002EE6;
 Fri, 23 Apr 2021 06:01:08 +0000 (UTC)
Subject: Re: [PATCH RFC 0/1] To add HMP interface to dump PCI MSI-X table/PBA
To: Dongli Zhang <dongli.zhang@oracle.com>, qemu-devel@nongnu.org
References: <20210423044713.3403-1-dongli.zhang@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <25113515-5c1d-c557-d0cc-04bfacecb6ee@redhat.com>
Date: Fri, 23 Apr 2021 14:01:06 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210423044713.3403-1-dongli.zhang@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 joe.jin@oracle.com, dgilbert@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/4/23 ÏÂÎç12:47, Dongli Zhang Ð´µÀ:
> This is inspired by the discussion with Jason on below patchset.
>
> https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg09020.html
>
> The new HMP command is introduced to dump the MSI-X table and PBA.
>
> Initially, I was going to add new option to "info pci". However, as the
> number of entries is not determined and the output of MSI-X table is much
> more similar to the output of hmp_info_tlb()/hmp_info_mem(), this patch
> adds interface for only HMP.
>
> The patch is tagged with RFC because I am looking for suggestions on:
>
> 1. Is it fine to add new "info msix <dev>" command?


I wonder the reason for not simply reusing "info pci"?


>
> 2. Is there any issue with output format?


If it's not for QMP, I guess it's not a part of ABI so it should be fine.


>
> 3. Is it fine to add only for HMP, but not QMP?


I think so.

Thanks


>
> Thank you very much!
>
> Dongli Zhang
>
>
>


