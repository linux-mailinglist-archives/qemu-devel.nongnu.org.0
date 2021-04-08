Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC7D3583A6
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 14:51:12 +0200 (CEST)
Received: from localhost ([::1]:56194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUU7r-0004O8-OG
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 08:51:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1lUTxG-0006Ky-0w; Thu, 08 Apr 2021 08:40:14 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:22620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1lUTxD-00035o-QY; Thu, 08 Apr 2021 08:40:13 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 138CY5Gn013901; Thu, 8 Apr 2021 08:40:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=H90tHts+tegsG6nD7ATKuW8WsRhqsYZ+Gr9XsG6//og=;
 b=ixKdTzwdsWsBwJtquedm8QIhJ8R4Bum3QuFD/VBWMCNd/NAYUB18iLoN/e8p8fx5BS6e
 4mXuKbGFD98f5V+dkYpAmwCTRtSe97fVj0OohPI6fnt4IN41RL8S6DG4GLrkb/gVr92b
 K2TNPUQe4v4Yh75yX/MY2AjOPjyE0XQIGyQpfXaai4LKVqi2sEnqXQY6eCJWm9eFbi1R
 JAQYIgLQQZ1obD5a1qB3hau43KhOJASPici2RF1bCmD2UDStl1sYpRSI7dvdHSZXD7Ix
 s4Sj2Yx1xnCVo16TATjT2ss3I57y3hTPkA0qc53sX02j6GFyIhnMAysSlQVjy+KYtlSL XA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37rvph8f9j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Apr 2021 08:40:10 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 138CYFOr014461;
 Thu, 8 Apr 2021 08:40:09 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37rvph8f8t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Apr 2021 08:40:09 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 138CWffB009492;
 Thu, 8 Apr 2021 12:40:07 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04fra.de.ibm.com with ESMTP id 37rvc5guju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Apr 2021 12:40:07 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 138Ce2o928246426
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 8 Apr 2021 12:40:02 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 65960A4040;
 Thu,  8 Apr 2021 12:40:02 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 65EB3A4053;
 Thu,  8 Apr 2021 12:40:01 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.29.249])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu,  8 Apr 2021 12:40:01 +0000 (GMT)
Date: Thu, 8 Apr 2021 14:39:59 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v1 1/1] s390x: css: report errors from
 ccw_dstream_read/write
Message-ID: <20210408143959.7b6a0fc3.pasic@linux.ibm.com>
In-Reply-To: <20210408110232.2bf02df4.cohuck@redhat.com>
References: <1617695053-7328-1-git-send-email-pmorel@linux.ibm.com>
 <1617695053-7328-2-git-send-email-pmorel@linux.ibm.com>
 <20210407194711.459176c3.pasic@linux.ibm.com>
 <20210408110232.2bf02df4.cohuck@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: k5uDrhgpyTtSlveRkUA6MdWJ-mfS2cZU
X-Proofpoint-GUID: e5iuqivAGI3rY3sT5zNqPH3VEHx0Z7Yu
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-08_03:2021-04-08,
 2021-04-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 malwarescore=0
 suspectscore=0 bulkscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104080087
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pasic@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: thuth@redhat.com, frankja@linux.ibm.com,
 Pierre Morel <pmorel@linux.ibm.com>, david@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, borntraeger@de.ibm.com,
 qemu-s390x@nongnu.org, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 imbrenda@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 8 Apr 2021 11:02:32 +0200
Cornelia Huck <cohuck@redhat.com> wrote:

> On Wed, 7 Apr 2021 19:47:11 +0200
> Halil Pasic <pasic@linux.ibm.com> wrote:
> 
> > So this begs the question, do we need this fixed for old releases as well?
> > 
> > My answer is yes we do. Conny what do you think?  
> 
> What do you mean with "old releases"? The dstream rework was in 2.11,
> and I doubt that anyone is using anything older, or a downstream
> release that is based on pre-2.11.
> 
> If you mean "include in stable", then yes, we can do that; if we want
> the commit in 6.0, I need the final version soon.

With old releases, I wanted to say any QEMU that is still supported by
us ;). For upstream it is backport to the stable versions currently in
support.

The commit message does not tell us if this is an enhancement or a
bugfix, stable is not mentioned, and neither do we get the information
since when is this problem existent. I simply wanted to have that
discussion.

Would it make sense to split this up into a virtio-ccw a css and a 3270
patch? That way if there was a problem with let's say 3270, we could
still keep the other two?

Regards,
Halil

