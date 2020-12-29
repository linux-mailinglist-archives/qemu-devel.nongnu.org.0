Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAAC2E6FFB
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Dec 2020 12:32:54 +0100 (CET)
Received: from localhost ([::1]:47222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuDFF-0002Qg-NJ
	for lists+qemu-devel@lfdr.de; Tue, 29 Dec 2020 06:32:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kuDE7-0001rs-I7
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 06:31:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kuDE1-00083I-L9
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 06:31:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609241493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Af6WOi56EjHz65nCJbhiCPwlx7bq/OTWInbgG1l9JxE=;
 b=P+QlDJyQ93xfa7a9A4AdljylHsMP6X7Jq89zDdaMGGicQsROosdowWUWcwthuGF9TGTJbO
 vFAG4m8LjYa+FBKjd4jJs/k7dWMTSTg0q4jO7imZRFOb3xq7xiUZw0HbFwA1L2r02DnOsb
 gV1ZweoJyE2EnDIXzIBYbwXFVW25VnU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-8P_X3J72NW-vxJrPcABivw-1; Tue, 29 Dec 2020 06:31:29 -0500
X-MC-Unique: 8P_X3J72NW-vxJrPcABivw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B40D6801817;
 Tue, 29 Dec 2020 11:31:27 +0000 (UTC)
Received: from localhost (unknown [10.40.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1818060BE5;
 Tue, 29 Dec 2020 11:31:19 +0000 (UTC)
Date: Tue, 29 Dec 2020 12:31:18 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Marian Posteuca <posteuca@mutex.one>
Subject: Re: [PATCH v2] acpi: Permit OEM ID and OEM table ID fields to be
 changed
Message-ID: <20201229123118.64e1a41f@redhat.com>
In-Reply-To: <878s9onq41.fsf@mutex.one>
References: <20201222113353.31224-1-posteuca@mutex.one>
 <20201223115445.71dc9f8c@redhat.com> <878s9onq41.fsf@mutex.one>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.178,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Ben Warren <ben@skyportsystems.com>,
 "Michael S.
 Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Dongjiu Geng <gengdongjiu@huawei.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Xiang Zheng <zhengxiang9@huawei.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 23 Dec 2020 23:56:30 +0200
Marian Posteuca <posteuca@mutex.one> wrote:

> Thanks for the thorough review.
> 
> Igor Mammedov <imammedo@redhat.com> writes:
> > On Tue, 22 Dec 2020 13:33:53 +0200
> > Marian Posteuca <posteuca@mutex.one> wrote:
> >
> > I see defaults are now initialized in pcmc->oem_[table_]id fields,
> > and sometimes used from there, so question is why
> > do we need use_sig_oem and keeping old code
> >
> >     if (oem_id) {                                                                
> >         strncpy((char *)h->oem_id, oem_id, sizeof h->oem_id);                    
> >     } else {                                                                     
> >         memcpy(h->oem_id, ACPI_BUILD_APPNAME6, 6);                               
> >     }                                                                            
> >                                                                                  
> >     if ()) {                                                          
> >         strncpy((char *)h->oem_table_id, oem_table_id, sizeof(h->oem_table_id)); 
> >     } else {                                                                     
> >         memcpy(h->oem_table_id, ACPI_BUILD_APPNAME4, 4);                         
> >         memcpy(h->oem_table_id + 4, sig, 4);                                     
> >     }  
> > I'd rather drop 'else' branches altogether and simplify to something like this
> >
> > g_assert(oem_id);
> > strncpy((char *)h->oem_id, oem_id, sizeof h->oem_id);
> > g_assert(oem_table_id)
> > strncpy((char *)h->oem_table_id, oem_table_id, sizeof(h->oem_table_id));
> > + padding
> >
> > and make sure ids are properly propagated everywhere.
> >  
> 
> I'm not sure if I understood this point correctly. You want to remove the appending
> of the sig part to the oem_table_id field, and just use whatever is
> passed by the caller for oem_table_id?
yes, according to spec unique oem_table_id helps only in distinguishing different
pieces of DSDT/SSDT tables, for other tables it doesn't make any sense to make it unique.
and this matches what real machines do.


