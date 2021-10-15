Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFCF42FBB2
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 21:07:28 +0200 (CEST)
Received: from localhost ([::1]:33410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbSYA-0006eC-Ub
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 15:07:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mbSUV-0003uO-DD
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 15:03:40 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:37714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mbSUS-0007hD-KH
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 15:03:38 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19FIG5O7006620; 
 Fri, 15 Oct 2021 19:03:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=0O8gFPL/awPaEk5pYdmF6P3YvaM2/9VEaKtCj7J0dmQ=;
 b=s7X+YK1xAVHW5jIUf1JWtue4gO1lSoskrNU20Gq60Tfsh4wMyqPXxEXQatJvqMQk12+h
 7IohKKRWv105YgKjjuvVHuSH9iE2vgnOmbSJzm/xKE0+7NjcejOz5bV6ylLrvckWAeKZ
 7X6/ssgUusM8seKeWheIoyNU3Jz9Ek6jTnjYp2uby5BlWxPNkOlbgAXcx4YqIBA5QTa/
 Kl0iMPvLGjqjk1EFXsiYoLlhsZMzy8hR/0kJANeZYju1A5ZbHegdUFRMSbNZkTz+qvzs
 ZtzOKm4KjN8tZqAgsIUypYZieVhO+5AJXhMM5r1wAxl1QyZ52BYQIwPXAsp0jihYO0Da Mg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bqes2g7aq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Oct 2021 19:03:32 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19FJ0aMo082428;
 Fri, 15 Oct 2021 19:03:31 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2049.outbound.protection.outlook.com [104.47.74.49])
 by aserp3030.oracle.com with ESMTP id 3bkyxxapvk-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Oct 2021 19:03:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nAKC6MqbWnljaVXc1bCqxEaarnUOIuRiU9bCw2lTdHnX1R95kLUEmne6S+XZ+SEM7r9cRs5t9SxDISsC/cvhH1VmQyvWsjSjI9fVre7WP4mrlKN/J7n/e2VTpUZ8ZWTXgGzqJ/2YKmCrzbnN/R4NBTQvUposywbwOTkyO5XDL80ong6AUezopuomFDjG9MXHf+/RWTb9uxreo0qboG/WxhYz7HfSSq0PJCIto587C7cDt3bxbuCku9QIto/iu/HFnrprPTybTBCe8PhOfWis5pMFvdw7LsnqnkYBYhZhAGimh6Zk0//43XiJ8LnDNIrHqAhIEKgO5mGxhlY+hhwtgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0O8gFPL/awPaEk5pYdmF6P3YvaM2/9VEaKtCj7J0dmQ=;
 b=gyWw4NRe50akGG73Mz1o8UNs4TvRucwXyugogT4iqaF3UTEH94x0yxHrFEY5MSPBFn9l3ktyq6LAuVkyr+mr3bdTZkcuot1WTUuyoscVkfKGWTGy6l2QhHHGWBj+4U5OPNC2gdVCo6v/i4C0NzHf0OT4kYdOFKLty6jUgMUQwQI+QLnX3BZCMrT41tu9nD6M59zorqWih+MPqEHqzB8BrC6Yr3pjxx1G1K6HZkW8RoYWL2ii4czij4qcpFYD0l7hn4z+Q0bJ+8nv+/00VAUQRJQPypAzkafwmvR6ZOtkk1xkWyKlVtqCKKZ4mx1KqEhydurxah0RkIfPS9vB+4k6kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0O8gFPL/awPaEk5pYdmF6P3YvaM2/9VEaKtCj7J0dmQ=;
 b=zatkxHyxd0nfi1sIH7UsFLqo7Q5/PBdPDHlxZc5fkcaeAELBUS7Xl2F/FMTW5naSu5Gtte5ULaQjXXl2ZYICdow6wtIfJxdAR8ayAPQsAbUGdXrRNaEt+0yq+8nG0KBqsiL9o+bc/EUsYDQlrikwcXth948Ing3JQHSqm2v2lRA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO6PR10MB5441.namprd10.prod.outlook.com (2603:10b6:5:35a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Fri, 15 Oct
 2021 19:03:30 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6%9]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 19:03:30 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 03/10] ACPI ERST: PCI device_id for ERST
Date: Fri, 15 Oct 2021 15:02:53 -0400
Message-Id: <1634324580-27120-4-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1634324580-27120-1-git-send-email-eric.devolder@oracle.com>
References: <1634324580-27120-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA9PR13CA0129.namprd13.prod.outlook.com
 (2603:10b6:806:27::14) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 SA9PR13CA0129.namprd13.prod.outlook.com (2603:10b6:806:27::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.9 via Frontend Transport; Fri, 15 Oct 2021 19:03:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0fde777-5015-462c-8314-08d9900e7a02
X-MS-TrafficTypeDiagnostic: CO6PR10MB5441:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR10MB54418202EBAEB89F35CC55BE97B99@CO6PR10MB5441.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q4mF1Zln66q7vjSqEFb/RZUFYG6dfdeX3PRqa+Inw8dDQml5DDheBYN7juOp6BKaDOQgEjtx1MmZiLBRbiTgt+pWUq4Z37uspT3oaBWqLmZhplfml5f1INY62nJztpQxMqOT+uCV4SFXbI4vCt2ChkriXHSC5qT2f5hDbIt4eoEWgsvjzqwQMtlkv7kfy5RAdvwToyN+NAoEZVZU5IbCOnOnJPkrLySDsbJ/5q5tt9GZ9q6wR3RnW7zvcxAdsgpAUD3xImUYg6lMqrZU4KJUyROUP6va0AyBYulwnluR6WbMyouJo+OGiyxTXx+7wdi2lkCB9Nx5KuIBqWQZmRbtz/qDeS7gLCNs7+O1t96yNSo8STsZpuW/eVh6x6bgTlBcfXIDotD0kNvK5HX80BaZmeBQyIRCx7+9zFeOpMrW6cTmnZxC/jt9XRRtZEL36ZerHslgFOVrdjKr7bvCLIFoOvvQXST8/EfKdbOXGSw09Cj8KoGuaT784JFnmTBgwfcD3sUCkp6oQZVMMpCLh3qgYN4kbdrjUXh1IM3wzDmbXiJAotEhfqLKzmInOLrJrbhF9Rzg4RFl9zfB2X0eMq5glNUcaJqjOD3oN6u+PkozETH4/UeFq2+vBfCWJ21Nz622+7Ho6MmqZHBqpXADVsaMpLNP8tOXCefAQIFY9pWfMdeVeYv7u+nXCCoHR4N51RKPqaQD/jNdi3Lcab0I2TsvDQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(36756003)(186003)(66476007)(66556008)(66946007)(8936002)(4744005)(2616005)(86362001)(6666004)(2906002)(956004)(508600001)(5660300002)(7696005)(6916009)(4326008)(52116002)(8676002)(38100700002)(316002)(6486002)(107886003)(38350700002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GJ6ZdW+Cw7LOt1QjzlltYC0BRTrlknVHq7wOo3PF0792gz5j3eOnhEND0FWk?=
 =?us-ascii?Q?bn0KY/gcwaCHBcwNUmMVRmiCRbmGJa4Le5brYrBuEbmMMYkA4OL4hLPfzyhD?=
 =?us-ascii?Q?omzGhmU0Lp4Ds64tBUG2SB8dOp6zHBnVU8dN5A69fr8Km3nAShzIPzSx9v3V?=
 =?us-ascii?Q?gGW2Ag7kHthp6mpZklOuSbB0ACa6IgLY8tayBB+kfmtpzN3/GzQs3d98Zpmx?=
 =?us-ascii?Q?LouuHv4ZMGemLcJ8NX/5huvmZyyLQ3HfOEuwSKyoL+R1nfSjQilTCPv2C6D4?=
 =?us-ascii?Q?3D6Btyo2SRK4Tt/b9zLJ+GVJ9wojt3FIzyKbRLHTsvSzNG/gW3FLeZTeGDIf?=
 =?us-ascii?Q?HdwPEbsTh+w1ioTO1Tb1r2C6xKwsnLBDo3JnXWt+IcpKpSY2dV0ytZSqQ1+F?=
 =?us-ascii?Q?2RGCv1NsgukJ/Ev2Abt7fARQnjWVw303SEGleRHF4w37YpHj0oXbcNZRIC7a?=
 =?us-ascii?Q?flQTvGaRFa1sTdZOcb4qAWD8Bhr59vCMABJPQZ1nr0h0rx2icZAnlUjf6lsv?=
 =?us-ascii?Q?Lo49Rnlq8cp+tcldklJwMh/LTDbhQqbZhIQHNoq+p+rJ7ZMa/wAkSK2Xx3z9?=
 =?us-ascii?Q?2GLPAWDSqkGZaJdXqu3Q6rW8QsksrrZRCaeNofwZ7f+NahThGl/c8KckPrSh?=
 =?us-ascii?Q?BmBCGRgWaq3UVpFmykUmBpZpBnR/zgug+VC9n4gvbI9h0luKQTwMHmz+jED7?=
 =?us-ascii?Q?nO1ERVv7HQsYfKGHAzI2oGdd6PwAvLQNcwffybQle5RWeQxiLi7xixH43bt6?=
 =?us-ascii?Q?4D8nfiyHNRt343htdi4BbVXljmuo7G5vMDwu7MKFVHsQE03ZAGgYGsmxEq0C?=
 =?us-ascii?Q?Z0qpj7F0vDxepds2PnGsMn/a7Q23ut2kBwQ5j6wmjM7r7eJZ2Oevv4XtgLw6?=
 =?us-ascii?Q?k/Mem1dCcKGKhm5XCcCldV9WafFhCoR4l9+ZlLPHEY2W6TiOZ5z+sUdQZhxV?=
 =?us-ascii?Q?BBhSQnndDISUX/VNPJIbgqdVx5YoNsewKK/LqKeMKxKWRGERDAO+7Gq6dRB5?=
 =?us-ascii?Q?ZsEK6jdXGP1ZWgDUM/BnIplCyUPX2rUml0z0R1UQXwz0Arh4myZmB7+t7ex+?=
 =?us-ascii?Q?5negeFvomSjbZnR5woYTkrGkY0H3uCT/CnkJmtsZgGo+YnhdXwbND8vmLpiU?=
 =?us-ascii?Q?CB06hSBfI7tKA/RMTil7AdzxyNhY5XTTPrfE0tZUkMCkUR1L5thz/QCsV+ZT?=
 =?us-ascii?Q?0L7PHkOG4aaR8jCykbGvGZe/0Ak11eGvDfjJPAE53he+vaQBY0CU5qAqzk2E?=
 =?us-ascii?Q?mYOuRj8bHRLLZ+U4OmYV+ukjQDFELTs75zu4P5KoZiYobvW0Qd1JMTN8fSjh?=
 =?us-ascii?Q?d3DrY7sKNK0iLrTnWePXnexO?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0fde777-5015-462c-8314-08d9900e7a02
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 19:03:30.2195 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /t5lIX4P19a4NuRUgDCHSCE3FptzVRlwEtVvHS/wYb7fx8i7VV2RjDtAE8tzIN4vhs9R+HigEhYliomlRDUa1eX+APdIO5nF1h8AQRTCd/A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5441
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10138
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 suspectscore=0
 mlxlogscore=951 mlxscore=0 bulkscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110150116
X-Proofpoint-GUID: -81xXppT46ZrrS-UPLe9f8oJs-y0UleC
X-Proofpoint-ORIG-GUID: -81xXppT46ZrrS-UPLe9f8oJs-y0UleC
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.001,
 RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
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
 konrad.wilk@oracle.com, pbonzini@redhat.com, ani@anisinha.ca,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This change reserves the PCI device_id for the new ACPI ERST
device.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Ani Sinha <ani@anisinha.ca>
---
 include/hw/pci/pci.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 7fc9013..45b79b1 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -108,6 +108,7 @@ extern bool pci_available;
 #define PCI_DEVICE_ID_REDHAT_MDPY        0x000f
 #define PCI_DEVICE_ID_REDHAT_NVME        0x0010
 #define PCI_DEVICE_ID_REDHAT_PVPANIC     0x0011
+#define PCI_DEVICE_ID_REDHAT_ACPI_ERST   0x0012
 #define PCI_DEVICE_ID_REDHAT_QXL         0x0100
 
 #define FMT_PCIBUS                      PRIx64
-- 
1.8.3.1


