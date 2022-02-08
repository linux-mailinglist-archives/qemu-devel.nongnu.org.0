Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7284AD41A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 09:54:58 +0100 (CET)
Received: from localhost ([::1]:58408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHMH2-0000hn-8k
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 03:54:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1nHKpp-0001tN-HB
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:22:45 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:40960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1nHKpk-0001v9-St
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:22:45 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2186ZONm012758; 
 Tue, 8 Feb 2022 07:22:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2021-07-09;
 bh=+9ru/Ta3si1n1ZRv0gO+wtsc29o2yblzKsqJ52uPw2I=;
 b=NHGfaMSZv5QzIp0KDs8Ank02G7vNZOOIj0tuNk1utSdQhfJ/24ctFrxovcaAOfzfHvyj
 j53bv20/fHsSWHEhAPcTRxIyq9iM+0MD1R/Zfs+14ZwmJP78veFakBizSmtRj/AU+hAE
 jRiu/FJrFD9fuouWR0SAKEQarW6F9F1rWP0Tf9Dy++Y7S0QfPyLZZkG89EMcr/HPBiZp
 EmONu4gTzZ3OptSG5LFHa5NDyMgf/fzTRjT8w/1GC+UjafUm9vkJNtusB04waUdt64HI
 vPdiM/rHGZIV3wxgXZq+lhgmiHsiheqoWeO9YT1ksIUuGfNvemjkk6gptDBkAIhOPzJK JQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e3fpggk40-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 08 Feb 2022 07:22:34 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 2187BlYl093365;
 Tue, 8 Feb 2022 07:22:33 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
 by userp3030.oracle.com with ESMTP id 3e1ebykknc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 08 Feb 2022 07:22:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nv25M/vo3BcP+Z4AVKJvOPgFeZgDXGG7q3H3ob1tIDL24FZ4mobCaQxr0XDhb+9bsMkAzOGBxMDza/CsOG/Js3XAI2PIUo80f0bc0NLpmBvhnxzcRdDe6ljqpGHzjOYmPq605CpoVMldym3bZQ2rWZC/2hUUNnBRthd5CMKoaY/bOibp+Pq7Db0caCKlFLMUDXT+6bfMj9aIGqvPRAnkS5hEeehpex8eBCTrSreP3iKfQNWy75O+RRhLNDSDdMnFDz4ZGt2iPMVpdPhOiTD4xM3YxpzjjwuiblJEASHiBs58sjcXyAhwq1Nrh3jECEeQjmNGUKd68lzwU618Um/R1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+9ru/Ta3si1n1ZRv0gO+wtsc29o2yblzKsqJ52uPw2I=;
 b=n0VideDqbXdXqkbYQUA7SZzr7uE8K69vQImODSqAMi28JiXYhM5uv0OXDBfWQDy9pLf3WE5uMbXRKLym6nZ/J4ofOheYNmWHQTNPE/WbUSvlZJ8gRsJcx2e2AIwcg5h8Yxc/Mkh1ntF00u+VdaL8niyxQv15u+bfRM3R+ThP6VslyDNE2Ux+1+RO8rvVai8WmJAy5SycbLPREMOynlz9UeiHlNR5MvHH2LcsmItPHnBtTlDbkT2CIuu3rWZ6nYjKZQVLG2hcmDlsrYbj2TwmxJxGOIyWfqBU1Hk5JmPjpDbzvWo4bl2LGzdFY8VwzbGxaL5iYm7qCrgrlTNDNDK2gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9ru/Ta3si1n1ZRv0gO+wtsc29o2yblzKsqJ52uPw2I=;
 b=cjHhUM7YV7/kaUXCW/ZnuWl119Bc+ECRDCdJ8TaA9ftPnxdfTSEjIKSuw0dJ6mR9IlDltRWIjctt82gueeL1IwiszqWLzYEav/Rd3juMyNY01cPuvF8Kb5+tOgxSJMr0Xw1DzjpPj1Rg8CasO0GctIuXMF6YJfK4KomzZcEKjDo=
Received: from BYAPR10MB2869.namprd10.prod.outlook.com (2603:10b6:a03:85::17)
 by SN4PR10MB5608.namprd10.prod.outlook.com (2603:10b6:806:20b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Tue, 8 Feb
 2022 07:22:29 +0000
Received: from BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::4bd:1cfa:5aee:6c81]) by BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::4bd:1cfa:5aee:6c81%3]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 07:22:29 +0000
From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC 0/8] ioregionfd introduction
Date: Mon,  7 Feb 2022 23:22:14 -0800
Message-Id: <cover.1644302411.git.elena.ufimtseva@oracle.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0006.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::19) To BYAPR10MB2869.namprd10.prod.outlook.com
 (2603:10b6:a03:85::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c90d33a4-3cbd-4461-d2c1-08d9ead3c3f5
X-MS-TrafficTypeDiagnostic: SN4PR10MB5608:EE_
X-Microsoft-Antispam-PRVS: <SN4PR10MB56083ECD26FBD82BFAB6B07A8C2D9@SN4PR10MB5608.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xMoTp0QzvhJHDII0mww1l4Piii9H1Myu9d/qcpiWlUqIYyMWR8c/qr40Ggi9s2A1N1dYr/MZ0b0NSTfGuU6zjeOxci2rGhHf6w/PN8A83ZAjzKUHlQu/1HRDCfu3oGJb/QMvQckYZo1dUWhpO54kwksEwi8vc9ynpuFSrxppOIUclxjHk0+XR+6c5lnjsUTvXVtEZ5JHaPJ8BxSbsmgOSTT/cR9dSE8I2EB/j55LU7hBshsSgxyDzlIAoSOsLqu0s740rDJi+At/bbkZCicDtwNxkPOnFfjr4DYLSzXVBOY6Wm35MBgw6hMLkGixUUxHaruGdXIj+HXJzk+iIun/gOMnx4zEEWS3nL4+eui0aEEYJKUm/w+mDPztCAnGltWgeOMN3+bEoKxzBzJFS0uZFJGzeCIcxOE6KD+SAdDImZKdXkM4MtQnFqPthcyRoqYof3fdJhpS+EuTpHHKy52R32+oT1ThYuLFGgrodVIKamKog3m9KtSz3vCA5rnDk5dHOlOp2Lu2pAJe/LyYqVkpuhNsglPbZ3h4SwFBMMY/dhoyRkZA0bpbZzfA1h+FIfkNIEbbTTwUezyW2ZQeFJZDA2BJxbGvkrISKOTeFRfHFn5JseWCskujLfVIoqgy89LIG419sr2FKh76RsUJxAVIQQxHIFGCzX7EaJCYUV51PjjkHR+QpKElg0NHIiaGYUBzcdlszUOpr05ZgcG7ghsi10ZtHDUgIC912f+6eJLsSLE95S09LO4OwSXMlWPd15TklhlTUVDsOb0Q71wyHIlxcQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2869.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(966005)(6512007)(36756003)(83380400001)(186003)(38100700002)(86362001)(5660300002)(7416002)(2616005)(6486002)(44832011)(508600001)(6666004)(8676002)(4326008)(52116002)(2906002)(66946007)(66476007)(6506007)(66556008)(6916009)(316002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n0YrDiKTmxhSuwHvVVjhc5h/wg6v0jWnccIBiT0RCSJiE6drQ/z/ZrT+wE3s?=
 =?us-ascii?Q?vf5pWXe+oWJsSR8ECG5QvRdLGaKMLFbmrjOIFrUVx81rB2M2RGWX++bRMSxu?=
 =?us-ascii?Q?1YnQDLHQr1vCmuea5qy7XuhwIaTzw6AGnvuBpf+jeqtiDTEG9dSWqEmk5CXl?=
 =?us-ascii?Q?AjF70JOS1CScdnPyc+5+La37qydVBja7yMbzBpjpxmzMZvPW7AVhRi4jaISN?=
 =?us-ascii?Q?5jWkH2LDDqcBUb4vZgXb+TI2XSThb2Mhma+wFbYecida3pW2XUWZ6nML7oen?=
 =?us-ascii?Q?yoANVNSYUbfm+8OtfTUB3z7lf0JkdHtAXDwyB0Hnubr5w/3fay2wla2Oqr06?=
 =?us-ascii?Q?RCA2/AT50uWJRUKWnuQW4zD9kPdSHv84QfyOK33/4rsAS6F77ausXYCVQBhD?=
 =?us-ascii?Q?mT8DaMTWl/w8BwNgODxSEIvq79QkymB03hcDu9XAh4STXDvQxHm1+cNFw0yw?=
 =?us-ascii?Q?dCikWG7Mq33ZFaasPJdHYM+ivF/DeReGsV5Jdybp91fKY6TbMynO+XEOFjnt?=
 =?us-ascii?Q?eqitStYATFywBNvkgX2Jp5WgHdSlIcYZj+m2c5iW1UQJmpspu1p59uYNEnhW?=
 =?us-ascii?Q?la4UvjYDnu2lxdqCy8qSHGCJLwFtqGB8gcGn7hIp2nh6KRYW3GJvlkcot6Fb?=
 =?us-ascii?Q?ns8Qn0YOmO8i8bDwLqTMqBducMwllvyzTOTDR27u/McYHzETSMxDRkEsA0I/?=
 =?us-ascii?Q?BG+3F+Edv3OsTNADG8+qun21LGHh0uVt5H5cfZ7KjB82WsEhISa1sq8dF6wT?=
 =?us-ascii?Q?yNb5CSeQycMu4rVGEelso3d0z08Hni2kLBSkZlCKAWDZ7YZKHI/auYR4292F?=
 =?us-ascii?Q?mGrIfQ3V7pyEEXLc2e48U2uMwxmyRQD4+l4zLsmZ+VF0AJpLB23oDQGqpJgl?=
 =?us-ascii?Q?d8nbVOai5en/3SUcmknSG6as2jCli+AGDKbFWykDflJm3NNAMvDXdOSFT6hy?=
 =?us-ascii?Q?yedlWFR2pBn/mAJsFsATSifOvpwh+GZ6Uylw705/f28kqHHtPjNWJal1Lx+v?=
 =?us-ascii?Q?0jhqX/vnsGVByjZ2HWYSal/6OxXHUbbEut2LK4ZcmU02zo1kd/c2hin11cGQ?=
 =?us-ascii?Q?76qGMo4HpltOhoyOVp5o1mY1jdsp2SXcaYtqC1J+aQkSHiaw8vDXir7qHkf8?=
 =?us-ascii?Q?/BOTuQaqn3JYEHCpuliVMYLfC+m4EOL5Xr2MHJs8SRecYNa12R1slTsbKxkv?=
 =?us-ascii?Q?2XX3tjxFCPKTwbWmrGU8UVRX6Vd+Hf+nktCY81oONstPhS3CXgsxvlmHS2Bc?=
 =?us-ascii?Q?o5W03+guGkkeDXPi80xSgfdr86ywJbbVg8euqX8cPlX8VQudC20S8+eZMzoo?=
 =?us-ascii?Q?vsJ+bb1hqdicn96IUHsk+9VpasfiGtl/1FjhUPUUm31/uBIsyxTHQCcRu2GR?=
 =?us-ascii?Q?/I/ISWVYjckCX4kmbBx0L9/sckz5L+hEhIMBu7fPOVGvjd0rIeLtAXfz9o+D?=
 =?us-ascii?Q?2W25GrmHFP4otdTiaFNPpshEgckYqlnD95J3L11pOauiD8GDeBp1vAxPKvVS?=
 =?us-ascii?Q?rNdYs+fv60DD3wiRd0rHvPmbDJsMKeh8ADYpbc2j74c5+7bh1gau1fX/umrA?=
 =?us-ascii?Q?kTjLOuCxIFytCP6Xix5HhlUxvbAP7HabjOSXMrP0nEk5JZytcItuqlVhos/M?=
 =?us-ascii?Q?Lrv+N76sV76aM56ftYNRZe6h7bApi3f6QsHZyY4TPsBjw0cSCub1ZFQaKtfo?=
 =?us-ascii?Q?qDuK3f9XbSNTlNoPRrUB6/IycXJVGVnMn+s8zMVrww8gxNzwRbiSQGJcB//c?=
 =?us-ascii?Q?MD5pyDdiow=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c90d33a4-3cbd-4461-d2c1-08d9ead3c3f5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2869.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 07:22:29.8020 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DNBxLNnf61PXv/JOeuS32BE2pdoE+O9D9W6XMG4a2xgFIhHhzd0X/zMZ7Al9G3+k3UlVVy2QttWtkRgd387RDcTiaN2VUh06cQaOw7Rpzgg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5608
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10251
 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 suspectscore=0
 mlxlogscore=643 mlxscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202080038
X-Proofpoint-GUID: vIYL6MwP-3EluNMXe2htPc_iAmHu3HAT
X-Proofpoint-ORIG-GUID: vIYL6MwP-3EluNMXe2htPc_iAmHu3HAT
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=elena.ufimtseva@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: eduardo@habkost.net, john.g.johnson@oracle.com, cohuck@redhat.com,
 jag.raman@oracle.com, john.levon@nutanix.com, eblake@redhat.com,
 david@redhat.com, armbru@redhat.com, peterx@redhat.com, mst@redhat.com,
 berrange@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset is an RFC version for the ioregionfd implementation
in QEMU. The kernel patches are to be posted with some fixes as a v4.

For this implementation version 3 of the posted kernel patches was user:
https://lore.kernel.org/kvm/cover.1613828726.git.eafanasova@gmail.com/

The future version will include support for vfio/libvfio-user.
Please refer to the design discussion here proposed by Stefan:
https://lore.kernel.org/all/YXpb1f3KicZxj1oj@stefanha-x1.localdomain/T/

The vfio-user version needed some bug-fixing and it was decided to send
this for multiprocess first.

The ioregionfd is configured currently trough the command line and each
ioregionfd represent an object. This allow for easy parsing and does
not require device/remote object command line option modifications.

The following command line can be used to specify ioregionfd:
<snip>
  '-object', 'x-remote-object,id=robj1,devid=lsi0,fd='+str(remote.fileno()),\
  '-object', 'ioregionfd-object,id=ioreg2,devid=lsi0,iofd='+str(iord.fileno())+',bar=1',\
  '-object', 'ioregionfd-object,id=ioreg3,devid=lsi0,iofd='+str(iord.fileno())+',bar=2',\
</snip>

Proxy side of ioregionfd in this version uses only one file descriptor:
<snip>
  '-device', 'x-pci-proxy-dev,id=lsi0,fd='+str(proxy.fileno())+',ioregfd='+str(iowr.fileno()), \
</snip>

This is done for RFC version and my though was that next version will
be for vfio-user, so I have not dedicated much effort to this command
line options.

The multiprocess messaging protocol was extended to support inquiries
by the proxy if device has any ioregionfds.
This RFC implements inquires by proxy about the type of BAR (ioregionfd
or not) and the type of it (memory/io).

Currently there are few limitations in this version of ioregionfd.
 - one ioregionfd per bar, only full bar size is supported;
 - one file descriptor per device for all of its ioregionfds;
 - each remote device runs fd handler for all its BARs in one IOThread;
 - proxy supports only one fd.

Some of these limitations will be dropped in the future version.
This RFC is to acquire the feedback/suggestions from the community
on the general approach.

The quick performance test was done for the remote lsi device with
ioregionfd and without for both mem BARs (1 and 2) with help
of the fio tool:

Random R/W:

	             read IOPS	read BW     write IOPS   write BW
no ioregionfd	 889	    3559KiB/s   890          3561KiB/s
ioregionfd	     938	    3756KiB/s   939          3757KiB/s


Sequential Read and Sequential Write:

                 Sequential read		Sequential write	
                 read IOPS	read BW	    write IOPS	 write BW

no ioregionfd    367k	    1434MiB/s	76k	         297MiB/s
ioregionfd       374k	    1459MiB/s	77.3k	     302MiB/s


Please review and send your feedback.

Thank you!
Elena

Elena Ufimtseva (8):
  ioregionfd: introduce a syscall and memory API
  multiprocess: place RemoteObject definition in a header file
  ioregionfd: introduce memory API functions
  ioregionfd: Introduce IORegionDFObject type
  multiprocess: prepare ioregionfds for remote device
  multiprocess: add MPQEMU_CMD_BAR_INFO
  multiprocess: add ioregionfd memory region in proxy
  multiprocess: handle ioregionfd commands

 meson.build                     |  15 +-
 qapi/qom.json                   |  32 ++-
 include/exec/memory.h           |  50 +++++
 include/hw/remote/ioregionfd.h  |  45 ++++
 include/hw/remote/machine.h     |   1 +
 include/hw/remote/mpqemu-link.h |   2 +
 include/hw/remote/proxy.h       |   1 +
 include/hw/remote/remote.h      |  31 +++
 include/sysemu/kvm.h            |  15 ++
 linux-headers/ioregionfd.h      |  30 +++
 linux-headers/linux/kvm.h       |  25 +++
 accel/kvm/kvm-all.c             | 132 ++++++++++++
 accel/stubs/kvm-stub.c          |   1 +
 hw/remote/ioregionfd.c          | 361 ++++++++++++++++++++++++++++++++
 hw/remote/message.c             |  38 ++++
 hw/remote/proxy.c               |  66 +++++-
 hw/remote/remote-obj.c          | 154 ++++++++++++--
 softmmu/memory.c                | 207 ++++++++++++++++++
 Kconfig.host                    |   3 +
 MAINTAINERS                     |   3 +
 hw/remote/Kconfig               |   4 +
 hw/remote/meson.build           |   1 +
 meson_options.txt               |   2 +
 scripts/meson-buildoptions.sh   |   3 +
 24 files changed, 1199 insertions(+), 23 deletions(-)
 create mode 100644 include/hw/remote/ioregionfd.h
 create mode 100644 include/hw/remote/remote.h
 create mode 100644 linux-headers/ioregionfd.h
 create mode 100644 hw/remote/ioregionfd.c

-- 
2.25.1


