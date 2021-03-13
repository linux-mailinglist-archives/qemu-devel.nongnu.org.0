Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 683C1339B0A
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 03:11:17 +0100 (CET)
Received: from localhost ([::1]:37256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKtkI-0007Xt-F6
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 21:11:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1lKtiu-0006vv-Uj; Fri, 12 Mar 2021 21:09:48 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:44146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1lKtit-0003Vw-0m; Fri, 12 Mar 2021 21:09:48 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12D25dgW104278; Fri, 12 Mar 2021 21:09:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=rQSVjN/zf+GXAq2Oq5w0NBL9a6IVAXo/himTbccAAdg=;
 b=oMEQx/JTOr92UE5NVG+TaZuGYtavw8XIRBrExz04AG4TuC4aR6HKYBo5Fcpzj4ETQIF+
 pEG6lqnG4stB44QpkX1MTS56w+Brk0ai/nnZL2EgTrc7lLU1Kh0R0Yb80Phu+GgLxcqz
 Tr2KyCaezztEuCTjri3I95a0LEdMnIuUQ/zMdHoyFQLQQNwHDphue8AdXxlwgaARAQx0
 DRT9wA54vMXD2LFP0mojwGYEOUdphZHRKVrlfRTywyeHLcu45d0/WSsq0SraZ7UocO8H
 +VT1cYunbMfhyTcGF4tOJVM7abiWCrkXnOuKd1mZZSEgNit21nvvbpCtMqzwekaaCceW DA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 378a33pyef-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Mar 2021 21:09:42 -0500
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12D26B8h109503;
 Fri, 12 Mar 2021 21:09:41 -0500
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 378a33pyd8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Mar 2021 21:09:41 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12D28Ar7026461;
 Sat, 13 Mar 2021 02:09:39 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 378gka84c7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 13 Mar 2021 02:09:39 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12D29aPr37093644
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 13 Mar 2021 02:09:36 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0224642041;
 Sat, 13 Mar 2021 02:09:36 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 05A1C42047;
 Sat, 13 Mar 2021 02:09:35 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.44.135])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Sat, 13 Mar 2021 02:09:34 +0000 (GMT)
Date: Sat, 13 Mar 2021 03:09:33 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Subject: Re: [PATCH v3 1/1] hw/s390x: modularize virtio-gpu-ccw
Message-ID: <20210313030933.7f89b7e5.pasic@linux.ibm.com>
In-Reply-To: <YEd2SnQkdtfhI4dL@redhat.com>
References: <20210302173544.3704179-1-pasic@linux.ibm.com>
 <20210305214603.GF3139005@habkost.net>
 <20210309124512.6goag5jblcje3umk@sirius.home.kraxel.org>
 <YEd2SnQkdtfhI4dL@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-12_13:2021-03-12,
 2021-03-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 mlxscore=0 bulkscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103130011
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
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
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Bruce Rogers <brogers@suse.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?TWFyYy1B?= =?UTF-8?B?bmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Mar 2021 13:21:14 +0000
Daniel P. Berrangé <berrange@redhat.com> wrote:

> > Well, yes, in a non-modular world this will work perfectly fine.  We
> > only compile objects actually supported into the system emulator.
> > 
> > With modular builds we have the situation that we have shared modules
> > which may or may not work in specific system emulators, for example
> > hw-display-virtio-gpu-pci.so or the ccw module added by this patch,
> > because the given system emulator doesn't provide the needed support.
> > We have some which don't support pci (avr for example).  Likewise ccw
> > is supported by s390x only.  
> 
> We could solve this by having a different location for loading modules
> for each target.
> 
>   *  /usr/$LIB/qemu/
> 
>     All the real .so's go in here as today
> 
>   *  /usr/$LIB/qemu/$TARGET
> 
>     Populated with symlinks to the .so's in the parent dir,
>     but /only/ those which are valid for this $TARGET
> 
> Then change QEMU  to load from the second dir.

I like the idea. I also prefer not trying to load a module X
that we know is not supported with, and ain't going to work with
target Y, over doing the load and making something fail afterwards.

I've not only started working on this, but I already have something
kind of works. But I'm not quite satisfied with it. I will spend some
more cycles before sending it out, but I doubt I will be able to get it
in a 'looks nice' shape. Thanks you!

Regards,
Halil

