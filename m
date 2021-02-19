Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7315D31F990
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 13:47:13 +0100 (CET)
Received: from localhost ([::1]:46724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD5Bg-0002jE-Gg
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 07:47:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1lD4qt-0005tY-Vb
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 07:25:44 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:53560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1lD4qq-000262-RM
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 07:25:43 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11JCOnwP113889; Fri, 19 Feb 2021 07:25:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : cc : reply-to : message-id : date : mime-version :
 in-reply-to : content-type : content-transfer-encoding; s=pp1;
 bh=M8dAMPjq+VPFEki7Yl0975ZPBWk6mWTH0oy6jBr2abc=;
 b=TTl8TFBYHHs1q5OMwZrIwbdg9WXbRCnB7fla2j6ztQioXLSdlQYQzz1YjoqYCmoGetm9
 kylcfegF4AjBxlqi1HnyJYrhPMnAHGHZe53uWvmoywb3lcmVoocx/Y39wvGLE7uIMgGG
 +1J8l/H3/avfXcmahb6Da3B3daPjo1///Gwf06+hbtOzrfbVMWbWqehRm9AhIHZR6yYO
 6ImIVhQZekFqL3QRnc32TDg6e+rt2sN7F5uaUJqLmZVra+Hq31s1wPCHxXsRN70DDPPq
 FOHs9KVBPYQjedP2WuTrYslYKqN5cyIimWRZ88/8Kr/dyrmwIbuPqW52irR9GnRCBbt2 9g== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36tdaj80a0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Feb 2021 07:25:29 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11JCFxIR003742;
 Fri, 19 Feb 2021 12:25:28 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01wdc.us.ibm.com with ESMTP id 36p6d9dccw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Feb 2021 12:25:28 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11JCPRMp26083776
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Feb 2021 12:25:28 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DFBA1AE060;
 Fri, 19 Feb 2021 12:25:27 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A299AE05C;
 Fri, 19 Feb 2021 12:25:27 +0000 (GMT)
Received: from lagarcia.br.ibm.com (unknown [9.80.202.220])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 19 Feb 2021 12:25:26 +0000 (GMT)
Subject: Re: How to get a wiki account?
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <BYAPR02MB488605CFFBDA686B2E00640BDE859@BYAPR02MB4886.namprd02.prod.outlook.com>
 <aa48784f-4cf9-b300-5715-752662a5be89@amsat.org>
From: =?UTF-8?Q?Leonardo_Augusto_Guimar=c3=a3es_Garcia?=
 <lagarcia@linux.ibm.com>
Organization: IBM
Message-ID: <483d301f-74c0-549d-ed67-a73938e01ca9@linux.ibm.com>
Date: Fri, 19 Feb 2021 09:25:25 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <aa48784f-4cf9-b300-5715-752662a5be89@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-19_05:2021-02-18,
 2021-02-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1011 priorityscore=1501
 mlxlogscore=987 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102190099
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=lagarcia@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: lagarcia@br.ibm.com
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/18/21 8:56 PM, Philippe Mathieu-Daudé wrote:
> On 2/19/21 12:23 AM, Taylor Simpson wrote:
>> How do I get a wiki account for wiki.qemu.org?  Going forward, I’d like
>> to be able to add information about the Hexagon target.
> As any user with access to the wiki can create user accounts,
> I created yours and will send you your information off-list.


I submitted a similar request yesterday to this list. Could you please 
help me creating an account as well, Phi?

Cheers,

Leo


>
> Regards,
>
> Phil.
>

