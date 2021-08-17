Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DC43EF5F7
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 00:58:54 +0200 (CEST)
Received: from localhost ([::1]:57314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG82m-000831-VU
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 18:58:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1mG81i-0007Bi-G8
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 18:57:46 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:40826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1mG81g-0000rG-RN
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 18:57:46 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17HMWs3T071831; Tue, 17 Aug 2021 18:57:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=np8wlXqYL7QJhV0IaVvxG0wg0wMrgdlyCqBNxaJ13XI=;
 b=nMayQ45eleUHLzZXq0Hs9yeDrp7KGwFewyINDtlsz5KHjoIOmb/MWeFFtjTJhMEiD+pL
 vaDsvsGGEG6Wk8+UwqzwXbQ4UgwqwDLS4AhGVhmWT6w/Q/Tw6GqZqBRcLk6qs0nWJwNx
 9cQqabgN5+E4hhVRzFNoZvheP4HLq8K54H+d13uWzAKSI6ytiU3Lmb9zflBR3oIP/dwW
 yVTXwSQ21AIuPMSq4WXJb+Srb/m2fHyt+YNwsIfRNts7YgBSU03i8O7d50lfc2Kpe1D8
 FUELfsLXqqV9s31uTuPQmLvcx4Fo2QMlDFQWyc1y+WbwqrjVEJ5xHh6E9oJdvlDtov3d +g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3agg09kapk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Aug 2021 18:57:39 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17HMuAGE158281;
 Tue, 17 Aug 2021 18:57:39 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3agg09kapb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Aug 2021 18:57:39 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17HMqM3g016046;
 Tue, 17 Aug 2021 22:57:38 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02dal.us.ibm.com with ESMTP id 3aeexvrykd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Aug 2021 22:57:38 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17HMvaNG48300294
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Aug 2021 22:57:36 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B9C567806A;
 Tue, 17 Aug 2021 22:57:36 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E98E77805E;
 Tue, 17 Aug 2021 22:57:33 +0000 (GMT)
Received: from jarvis.lan (unknown [9.160.128.138])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 17 Aug 2021 22:57:33 +0000 (GMT)
Message-ID: <b1b5adcdbf51112d7b3cc2c66123dea5276a4a6d.camel@linux.ibm.com>
Subject: Re: [RFC PATCH 00/13] Add support for Mirror VM.
From: James Bottomley <jejb@linux.ibm.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Steve Rutherford
 <srutherford@google.com>
Date: Tue, 17 Aug 2021 18:57:32 -0400
In-Reply-To: <CABgObfZbyTxSO9ScE0RMK2vgyOam_REo+SgLA+-1XyP=8Vx+uQ@mail.gmail.com>
References: <cover.1629118207.git.ashish.kalra@amd.com>
 <CABayD+fyrcyPGg5TdXLr95AFkPFY+EeeNvY=NvQw_j3_igOd6Q@mail.gmail.com>
 <0fcfafde-a690-f53a-01fc-542054948bb2@redhat.com>
 <CABayD+d4dHBMbshx_gMUxaHkJZENYYRMrzatDtS-a1awGQKv2A@mail.gmail.com>
 <CABgObfZbyTxSO9ScE0RMK2vgyOam_REo+SgLA+-1XyP=8Vx+uQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: sybo2ptpItzNBncfSeigdBQAf3gTpsTy
X-Proofpoint-GUID: q0XuyEINbO1nT3UB2CBwJ8qbUZslk6X5
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-17_08:2021-08-17,
 2021-08-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 adultscore=0 mlxlogscore=623 phishscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 clxscore=1011 spamscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108170141
Received-SPF: pass client-ip=148.163.156.1; envelope-from=jejb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-To: jejb@linux.ibm.com
Cc: Thomas Lendacky <thomas.lendacky@amd.com>,
 Ashish Kalra <Ashish.Kalra@amd.com>, Brijesh Singh <brijesh.singh@amd.com>,
 "Habkost, Eduardo" <ehabkost@redhat.com>, kvm <kvm@vger.kernel.org>, "S.
 Tsirkin, Michael" <mst@redhat.com>, Tobin Feldman-Fitzthum <tobin@ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, David Gilbert <dgilbert@redhat.com>,
 Hubertus Franke <frankeh@us.ibm.com>, Dov Murik <dovmurik@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2021-08-18 at 00:37 +0200, Paolo Bonzini wrote:
> On Tue, Aug 17, 2021 at 11:54 PM Steve Rutherford
> <srutherford@google.com> wrote:
> > > 1) the easy one: the bottom 4G of guest memory are mapped in the
> > > mirror
> > > VM 1:1.  The ram_addr_t-based addresses are shifted by either 4G
> > > or a
> > > huge value such as 2^42 (MAXPHYADDR - physical address reduction
> > > - 1).
> > > This even lets the migration helper reuse the OVMF runtime
> > > services
> > > memory map (but be careful about thread safety...).
> > 
> > If I understand what you are proposing, this would only work for
> > SEV/SEV-ES, since the RMP prevents these remapping games. This
> > makes
> > me less enthusiastic about this (but I suspect that's why you call
> > this less future proof).
> 
> I called it less future proof because it allows the migration helper
> to rely more on OVMF details, but those may not apply in the future.
> 
> However you're right about SNP; the same page cannot be mapped twice
> at different GPAs by a single ASID (which includes the VM and the
> migration helper). :( That does throw a wrench in the idea of mapping
> pages by ram_addr_t(*), and this applies to both schemes.

Right, but in the current IBM approach, since we use the same mapping
for guest and mirror, we have the same GPA in both and it should work
with -SNP.

> Migrating RAM in PCI BARs is a mess anyway for SNP, because PCI BARs
> can be moved and every time they do the migration helper needs to
> wait for validation to happen. :(

Realistically, migration is becoming a royal pain, not just for
confidential computing, but for virtual functions in general.  I really
think we should look at S3 suspend, where we shut down the drivers and
then reattach on S3 resume as the potential pathway to getting
migration working both for virtual functions and this use case.

James



