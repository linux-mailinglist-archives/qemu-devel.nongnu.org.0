Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 955ED324282
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 17:51:02 +0100 (CET)
Received: from localhost ([::1]:45196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lExNN-0005r9-14
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 11:51:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1lExJJ-0004F5-2z; Wed, 24 Feb 2021 11:46:49 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:55902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1lExJH-0003KA-34; Wed, 24 Feb 2021 11:46:48 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11OGZDTc099810; Wed, 24 Feb 2021 11:46:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=aowUJqwb1m1lUSuOPA2PseTql5N/kTnZLkCZtk4qkhQ=;
 b=esw62h4kZBwwjMdlFCW7YgvJbQrs2u+9X+N+IXjN19Sr9g1x87efiDGuw1Szt5GSASEO
 f/bjNCJMpiGYNbO13pBK+jCmdjAVwGRAAkMbm+XMyuRkUr7+OFPMwHDnPRRryCuy5LWn
 Zw+xV5CmCw4wuvmavKQlFEa9XH8QAbzGRWCV2z6NhvHwbNvPUtIrMs9hDYEVttjCtpto
 5qlE5M/2464ttRHbpa7/e1Ga1yGC0GBS1ylqpubEQHbasL0udyxQtFod6O9beOcOwnen
 VvSjYea7EHBFZq+mJuZFBa8ZeIqJjKAtJmPp9q8YYHnH0QlhQPYztg0XRRqQXr5zAcF5 gg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36wktm7f73-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Feb 2021 11:46:42 -0500
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 11OGZSWd101173;
 Wed, 24 Feb 2021 11:46:42 -0500
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36wktm7f64-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Feb 2021 11:46:42 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11OGgJXb008105;
 Wed, 24 Feb 2021 16:46:39 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 36tsph3qh1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Feb 2021 16:46:39 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11OGkaBl42074464
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Feb 2021 16:46:36 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AB8BAAE045;
 Wed, 24 Feb 2021 16:46:36 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AA1F5AE053;
 Wed, 24 Feb 2021 16:46:35 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.70.198])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 24 Feb 2021 16:46:35 +0000 (GMT)
Date: Wed, 24 Feb 2021 17:46:34 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 1/1] hw/s390x: modularize virtio-gpu-ccw
Message-ID: <20210224174634.58a1ecda.pasic@linux.ibm.com>
In-Reply-To: <20210224113617.6v42bfxyzvw6733h@sirius.home.kraxel.org>
References: <20210222125548.346166-1-pasic@linux.ibm.com>
 <20210224113617.6v42bfxyzvw6733h@sirius.home.kraxel.org>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-24_06:2021-02-24,
 2021-02-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102240127
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Boris Fiuczynski <fiuczy@linux.ibm.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Bruce Rogers <brogers@suse.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 24 Feb 2021 12:36:17 +0100
Gerd Hoffmann <kraxel@redhat.com> wrote:

> >  static void virtio_ccw_gpu_register(void)
> >  {
> > +#ifdef CONFIG_MODULES
> > +    type_register_static_mayfail(&virtio_ccw_gpu);
> > +#else
> >      type_register_static(&virtio_ccw_gpu);
> > +#endif  
> 
> Move the ifdef to type_register_static_mayfail, so this is not
> duplicated for every module which might need this?

I am concerned about a cluttered API. Having the documentation say:

/**
 * type_register_static_mayfail:
 * @info: The #TypeInfo of the new type.
 *
 * @info and all of the strings it points to should exist for the life time
 * that the type is registered.
 * 
 * If missing a parent type and if qom/object.c is built with CONFIG_MODULES
 * type_register_static_mayfail() differs from type_register_static only in not
 * printing an error and aborting but returning NULL. If qom/object.c is
 * built without CONFIG_MODULES type_register_static_mayfail() is same as
 * type_register_static() 
 * Returns: the new #Type or NULL if missing a parent type.
 */
Type type_register_static_mayfail(const TypeInfo *info);

does not feel right. Indeed modules seems to be the only
circumstance under which a failed type registration does not imply
a programming error. So I'm absolutely against shoving this logic
down into object.c. But I find the variant I posted nicer to document
and nicer to read: looking at virtio_ccw_gpu_register() one sees
immediately that if built as a module, it is OK if the registration
fails, and if built-in it is expected to work.

> 
> > --- a/include/hw/s390x/css.h
> > +++ b/include/hw/s390x/css.h  
> 
> Move this to a separate patch?
> The "add type_register_mayfail" and "modularize virtio-gpu-ccw" changes
> should be separate patches too.
> 
> > -static TypeImpl *type_register_internal(const TypeInfo *info)
> > +static TypeImpl *type_register_internal(const TypeInfo *info, bool mayfail)
> >  {
> >      TypeImpl *ti;
> >      ti = type_new(info);  
> 
> Hmm, type_register_internal seems to not look at the new mayfail flag.
> Patch looks incomplete ...

It definitely is. I messed up my smoke test (used the wrong executable)
so I did not notice.

> 
> take care,
>   Gerd
> 
> 


