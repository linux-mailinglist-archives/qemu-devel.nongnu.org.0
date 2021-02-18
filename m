Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CBC31EE3B
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 19:29:25 +0100 (CET)
Received: from localhost ([::1]:46598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCo3I-00071z-Iw
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 13:29:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1lCo1G-00064N-7z; Thu, 18 Feb 2021 13:27:19 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:25960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1lCo19-0001sQ-9Q; Thu, 18 Feb 2021 13:27:17 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11IICpqg140427; Thu, 18 Feb 2021 13:27:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=WeYxnzFDMynGwWznhO2NU04oRhQNhGy1Gvs0bmaD0P8=;
 b=k75PfiKbDtSoBwPzdHy9hAINhNBxj17VSI7Uu3uNkrCiZAbnpJkWFWljK91XkRrEtPN/
 UD9nIZlN007eZ2tbizNh3iG3uPwI8cuLU/bdTleCFkoex/vl6LkypgSA4MYCeSvT0RJs
 21QQkEq8Z4/Za/pkpBbtCn+u6ZgnJCh0uaP4X+N8IoOnnDpZdoPHIg4bPUjA5la8bHbX
 bMeuZNsKXkIjBf2V6Msga5YroJbyMbdWVahDIRpUPsHLtPzp4o4aIB/FoSNTtU6v2qtx
 myLSXP7QpUQtWvrIfK4892UUM4bK35T4EkIDmygb/6BuqObd7KPbfnmMxen3G586wUAk sg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36swap8dfm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Feb 2021 13:27:07 -0500
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 11IID2Bh141621;
 Thu, 18 Feb 2021 13:27:07 -0500
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36swap8det-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Feb 2021 13:27:06 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11IIC6W6000890;
 Thu, 18 Feb 2021 18:27:04 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 36rw3u9hak-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Feb 2021 18:27:04 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 11IIQn9234865558
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Feb 2021 18:26:49 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5071FA4040;
 Thu, 18 Feb 2021 18:27:01 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0D8F0A4053;
 Thu, 18 Feb 2021 18:27:00 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.71.158])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 18 Feb 2021 18:26:59 +0000 (GMT)
Date: Thu, 18 Feb 2021 19:26:54 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/1] hw/s390x: modularize virtio-gpu-ccw
Message-ID: <20210218192654.2f71f12f.pasic@linux.ibm.com>
In-Reply-To: <877e9bb4-cb18-334b-020f-a4857b07c420@redhat.com>
References: <20210218022227.979741-1-pasic@linux.ibm.com>
 <6c0f5acf-9ebb-ba04-1389-c6690796a6ad@redhat.com>
 <20210218113438.3fe80078.pasic@linux.ibm.com>
 <877e9bb4-cb18-334b-020f-a4857b07c420@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-18_09:2021-02-18,
 2021-02-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 mlxscore=0 malwarescore=0 phishscore=0 clxscore=1015 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102180146
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
Cc: Boris Fiuczynski <fiuczy@linux.ibm.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Bruce Rogers <brogers@suse.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 18 Feb 2021 15:44:47 +0100
Thomas Huth <thuth@redhat.com> wrote:

> On 18/02/2021 11.34, Halil Pasic wrote:
> > On Thu, 18 Feb 2021 10:23:16 +0100
> > Thomas Huth <thuth@redhat.com> wrote:
> >   
> >>> Since the virtio-gpu-ccw device depends on the hw-display-virtio-gpu
> >>> module, which provides the type virtio-gpu-device, packaging the
> >>> hw-display-virtio-gpu module as a separate package that may or may not
> >>> be installed along with the qemu package leads to problems. Namely if
> >>> the hw-display-virtio-gpu is absent, qemu continues to advertise
> >>> virtio-gpu-ccw, but it aborts not only when one attempts using
> >>> virtio-gpu-ccw, but also when libvirtd's capability probing tries
> >>> to instantiate the type to introspect it.
> >>>
> >>> Let us thus introduce a module named hw-s390x-virtio-gpu-ccw that
> >>> is going to provide the virtio-gpu-ccw device. The hw-s390x prefix
> >>> was chosen because it is not a portable device.
> >>>
> >>> With virtio-gpu-ccw built as a module, the correct way to package a
> >>> modularized qemu is to require that hw-display-virtio-gpu must be
> >>> installed whenever the module hw-s390x-virtio-gpu-ccw.
> >>>
> >>> Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> >>> ---
> >>>    hw/s390x/meson.build | 17 ++++++++++++++++-
> >>>    util/module.c        |  1 +
> >>>    2 files changed, 17 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/hw/s390x/meson.build b/hw/s390x/meson.build
> >>> index 2a7818d94b..153b1309fb 100644
> >>> --- a/hw/s390x/meson.build
> >>> +++ b/hw/s390x/meson.build
> >>> @@ -34,7 +34,6 @@ virtio_ss.add(files('virtio-ccw.c'))
> >>>    virtio_ss.add(when: 'CONFIG_VIRTIO_BALLOON', if_true: files('virtio-ccw-balloon.c'))
> >>>    virtio_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-ccw-blk.c'))
> >>>    virtio_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true: files('virtio-ccw-crypto.c'))
> >>> -virtio_ss.add(when: 'CONFIG_VIRTIO_GPU', if_true: files('virtio-ccw-gpu.c'))
> >>>    virtio_ss.add(when: 'CONFIG_VIRTIO_INPUT', if_true: files('virtio-ccw-input.c'))
> >>>    virtio_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('virtio-ccw-net.c'))
> >>>    virtio_ss.add(when: 'CONFIG_VIRTIO_RNG', if_true: files('virtio-ccw-rng.c'))
> >>> @@ -46,3 +45,19 @@ virtio_ss.add(when: 'CONFIG_VHOST_USER_FS', if_true: files('vhost-user-fs-ccw.c'
> >>>    s390x_ss.add_all(when: 'CONFIG_VIRTIO_CCW', if_true: virtio_ss)
> >>>    
> >>>    hw_arch += {'s390x': s390x_ss}
> >>> +
> >>> +if target.startswith('s390x')
> >>> +  hw_s390x_modules = {}
> >>> +
> >>> +  hw_s390x_modules_c_args = ['-DNEED_CPU_H',
> >>> +	      '-DCONFIG_TARGET="@0@-config-target.h"'.format(target)]
> >>> +  hw_s390x_modules_inc = [include_directories('../../target' / config_target['TARGET_BASE_ARCH'])]
> >>> +  hw_s390x_modules_dependencies = declare_dependency(
> >>> +	       include_directories: hw_s390x_modules_inc, compile_args: hw_s390x_modules_c_args)  
> >>
> >> Basically the patch looks fine to me, but I wonder why all that above lines
> >> (related to hw_s390x_modules_dependencies) are requred at all? The other
> >> display modules in hw/display/meson.build also do not need to re-define
> >> c_args for example?  
> > 
> > The explanation is simple. Unlike most devices, the ccw devices aren't
> > portable. In particular both css.c and css.h includes "cpu.h", and
> > virtio-ccw-gpu.c includes "qemu/osdep.h". Furthermore osdep.h contains:
> > #ifdef NEED_CPU_H
> > #include CONFIG_TARGET
> > #else
> > #include "exec/poison.h"
> > #endif
> > so if we don't have NEED_CPU_H, among others CONFIG_KVM is poisoned, and
> > CONFIG_KVM is used in "css.h". Frankly, I can't tell under what circumstances
> > does css need "cpu.h".  
> As far as I can see, the only real reason right now is the CONFIG_KVM 
> section in css.h. I think you could simply move that into another header 
> file instead (cpu.h ?)
> 

Since everybody seems to agree, that that is the right way to move
forward, I can try moving things around like you and Connie suggested.

Regards,
Halil

