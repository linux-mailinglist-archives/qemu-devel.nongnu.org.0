Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D06C2364821
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 18:22:21 +0200 (CEST)
Received: from localhost ([::1]:40944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYWfE-0002um-VF
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 12:22:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lYWdc-0002LE-HW
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 12:20:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lYWdZ-0000UX-PL
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 12:20:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618849236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kxqE6/o4B7WczNp4hGx+ttlVUvgURFjGdid4nX+fQ/M=;
 b=HexNQednHMePatEcihDmVy3BnCfz22egDjOPF90+Jc+/Bx8c2s5hTNVwdr2++nQrzgYUgv
 Dl1fqJruv4JImKWxzb4ZnWbEarqaGryRYjCyQS1uhI0hSNT46ytk3ooQ7z4zpjaL0eLpxk
 8iEoh3eldInY7rkd9HmCdC/bf4hLqyA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-jndoQJiHPZCt1BRyhFnOig-1; Mon, 19 Apr 2021 12:20:33 -0400
X-MC-Unique: jndoQJiHPZCt1BRyhFnOig-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1BBA6D246;
 Mon, 19 Apr 2021 16:20:31 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-200.ams2.redhat.com
 [10.36.113.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1999610013D7;
 Mon, 19 Apr 2021 16:20:25 +0000 (UTC)
Date: Mon, 19 Apr 2021 18:20:23 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v1 1/5] hw/s390x: only build qemu-tod from the CONFIG_TCG
 build
Message-ID: <20210419182023.3b44e114.cohuck@redhat.com>
In-Reply-To: <0eecb78f-c521-f217-1ea5-e570dc080a15@suse.de>
References: <20210322191551.25752-1-cfontana@suse.de>
 <20210322191551.25752-2-cfontana@suse.de>
 <20210331130756.20971c8a.cohuck@redhat.com>
 <4eaf4c51-b940-66df-7ef7-61782b0cf31d@suse.de>
 <0eecb78f-c521-f217-1ea5-e570dc080a15@suse.de>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 19 Apr 2021 18:12:48 +0200
Claudio Fontana <cfontana@suse.de> wrote:

> On 4/19/21 11:11 AM, Claudio Fontana wrote:
> > Hi Cornelia,
> > 
> > On 3/31/21 1:07 PM, Cornelia Huck wrote:  
> >> On Mon, 22 Mar 2021 20:15:47 +0100
> >> Claudio Fontana <cfontana@suse.de> wrote:

> >>> @@ -25,6 +24,10 @@ s390x_ss.add(when: 'CONFIG_KVM', if_true: files(
> >>>    's390-stattrib-kvm.c',
> >>>    'pv.c',
> >>>  ))
> >>> +s390x_ss.add(when: 'CONFIG_TCG', if_true: files(
> >>> +  'tod-qemu.c',  
> >>
> >> Should we rename this to tod-tcg.c?  
> > 
> > I think so.  
> 
> Here we are a bit limited though by the fact that the object is currently called:
> 
> include/hw/s390x/tod.h:26:#define TYPE_QEMU_S390_TOD TYPE_S390_TOD "-qemu"
> 
> So there might be a compatibility issue in trying to make this consistent, which would mean to replace this with:
> 
> #define TYPE_TCG_S390_TOD TYPE_S390_TOD "-tcg"
> 
> What do you think?

How visible is this? I don't think the TOD objects are instantiable by
the user.


