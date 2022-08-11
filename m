Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F300258FCEA
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 14:56:39 +0200 (CEST)
Received: from localhost ([::1]:33770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM7jq-0006nv-6y
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 08:56:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1oM7H1-00028m-94; Thu, 11 Aug 2022 08:26:51 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:19588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1oM7Gw-0002W2-DT; Thu, 11 Aug 2022 08:26:50 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27BCMuIm001315;
 Thu, 11 Aug 2022 12:26:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2022-7-12; bh=9BQXBWlcTcvOi8NEnt4V59MxHKhkb9YLPyotaEmc+qM=;
 b=DaLsZ5SypY5uu3a50CatBcTQ7c5BNDPCt8E6c4iKXqoGBLdPgtwTd8YAt7IxXaxetL8M
 ZQO0/fXMlLQypV2GxfMGF87TWGBe5+Ay740GqogWE3gGKybbVjpoQa8stehyupd7BANQ
 63d3AtsK0UL+LHTx64wsxMsgkWOcqC8+LBjkOeoiLZmsJuEArV05QEjvGYh7TIfquPel
 d4OhHHHgswCcGXxsuiADdpC2ePRvH2of3bfg4XLBYPdmznM0gIxZ28A0KnBNsTStqqa7
 uY6czzGOxs3ZhLNuj7+nxwA/Q8KOeEA+TmqaKZ3JwJcxEThgqYqUqwGwSBJCc26PZOXu wg== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3huwq94n55-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Aug 2022 12:26:22 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 27BBq0UH023693; Thu, 11 Aug 2022 12:26:19 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2041.outbound.protection.outlook.com [104.47.73.41])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3huwqh2kr3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Aug 2022 12:26:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A26KvkQpEEO9nGzp9f35q00J2sh4quyaaQxJbstpgI0USu09KBkUAkHe6v49CjseB08UHIseLBGP0cJvU1HNtVLXnKahSQZqfyUnn82a6orEy5c6zHRK0AXeSUtKwwlDWL77qCHWFq0NH9VGDI7yczHvc3FDV8C/XfUQLvNLffA8q2Rg5Q1KsQVMYhxNTkNhytWPQpA9CXyCtS/42iVGJYRYKbKRm4jshRiLkM/O6L62bVvEDLKQCCiQoTK1kxHynKoIuusnlgXxY4bN/6ykKurIF1cVvLvs32MaSytj/J1r1dqnIzI2YMzzOEeDdM8FtyUVC66q6LjQuEG/jQqL6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9BQXBWlcTcvOi8NEnt4V59MxHKhkb9YLPyotaEmc+qM=;
 b=LYNOUzg7moVs8+b4lSDTj2wjgOkpYEHfEQamnbl+qJ/nyF7DLt0aePCk3RUS+OAeqJmrsxDtuLz+RvF2nsB0p+iyetR2HgpfkaxopLaEll5qyR5bR8kJWOzYD1+BrmKe5yFUtE0jFBzyKNsYfuykL2K4o2Zy1m67pFg36oZLVPRur7TsQeTzUl1VVDJfAtWFSJn8f//CsZhcbfDKRykB+p8Prm5iERsO5m2bbXWG3IaIWVs8MEOdUCxuD8s3FlcIPqVTOC+BgxMZ2tmUu7/BCUmcD7XM3HQtQ0w+NKYTw3ee3RZm5OCZzzGuF0CCC/UQiT/7pm45lpdR+FjDUiwWkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9BQXBWlcTcvOi8NEnt4V59MxHKhkb9YLPyotaEmc+qM=;
 b=evQ5uTHQfJJJuRqVRmXQUQo/1pSpFib6YPY7s+DukK7WFI+JjGNYHuynELgIz/PEzWr72GgJ8d4KoQ5+A/ISMYxFI+dNCC7UM0NAnTv8J7607jo4wC1o+8quHyelyyqNgvpBOb/1S0AoRzNWk3kDrV0AE2muHY+DKaosyWQK/R0=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB5846.namprd10.prod.outlook.com (2603:10b6:510:14c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Thu, 11 Aug
 2022 12:26:17 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::a9e2:3c71:4b09:789]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::a9e2:3c71:4b09:789%9]) with mapi id 15.20.5525.011; Thu, 11 Aug 2022
 12:26:16 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, qemu_oss@crudebyte.com, kraxel@redhat.com,
 si-wei.liu@oracle.com, joao.m.martins@oracle.com, eblake@redhat.com,
 qemu-block@nongnu.org, david@redhat.com, armbru@redhat.com,
 arei.gonglei@huawei.com, marcandre.lureau@redhat.com,
 lvivier@redhat.com, thuth@redhat.com, michael.roth@amd.com,
 groug@kaod.org, dgilbert@redhat.com, eric.auger@redhat.com,
 stefanha@redhat.com, boris.ostrovsky@oracle.com, kwolf@redhat.com,
 mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com,
 pbonzini@redhat.com
Subject: [PATCH v15 0/6] hmp,qmp: Add commands to introspect virtio devices
Date: Thu, 11 Aug 2022 08:24:38 -0400
Message-Id: <1660220684-24909-1-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain
X-ClientProxiedBy: DM6PR03CA0077.namprd03.prod.outlook.com
 (2603:10b6:5:333::10) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4b73035-fb9d-46a4-cb35-08da7b94afee
X-MS-TrafficTypeDiagnostic: PH0PR10MB5846:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UIUDhuU7eldpQQMkWRjOpNXSDoVCxXEOaND+fBqxtbt0lmhM4majdJ1ccGXsaK4fEGBNZX9H7W51UZCFuulbOFRikxXH+u0UsmXcXAG0uw5E9p0BDWhz/udZiKEEwCJxmeDmFbm7+Y2ipLBnq2IAYJab9UcFPPBu0odshm79r6agq3ab4vAc8QR/Y61iTGEo2DmkptuuZ29aMCM0g6VOqtgzZ6IlojGjOnVCiW9kJ0qClSrZaAg8L83fSStOb73xzJCUGXYnQlexA2V+oNXl7VRPN6w2MGQVhy0Tb4Q+e5hYB74iemZjzHBzIVWKMlJ2OZVDglJ62FSmO10CNvnUwHpIEEEvGnZxD2UsISRNZ3btWe7OaVIxdOyTwJWKffbO1x1fIU/ENbaEEe8Vq0I80OwEFYLAbjFihe15C4Q0rUHYTbdU826tz1WVtzpd6WILcBF94P3fLQat6kHnbVSnLTnBTt5mm1uUiWMVJVR3qmScguys2T3ZAIplvNDmsjfAcP+/KNZs+hiP3xLCEyuTsyllyv3ZGyX+gvLWTrOlSyoVl8zISHHz40nG7GbhZwfB3RjOQ7gyE6XYDBJ/a9Pdu69zQfhd+Ls0R4vJzm+am4GPUPya5CRc1MJn2gXr2PUqP4ZP88MN64hSYulBCYOxog+am6b+9jHXpjOVi9haEgU1AmfpNdSh0HmZ1qa/+N+f8yjH0mETYd82Bxncf0yF64fUXksCJOurlFL0SuPW2VDiGCGZFyDVWxxcBpPB/olKsPCk6fQswRVhObYQiMrQVTr2BK9EZX7a+rBztVyfbX0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(136003)(346002)(39860400002)(396003)(376002)(38100700002)(316002)(38350700002)(6916009)(66476007)(66556008)(4326008)(8676002)(8936002)(5660300002)(86362001)(30864003)(66946007)(44832011)(6506007)(6666004)(6512007)(52116002)(26005)(41300700001)(83380400001)(186003)(2616005)(7416002)(478600001)(6486002)(36756003)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V9bru7W8pp3JaMgIJYT4BEDQrYCpLk2F4n8hofvgo1e3t+1OlQN37JTJlKzR?=
 =?us-ascii?Q?OtPGRStu4H0/q0ZksIOt5211remG/0JRLHy3I6qyqHJ/fPg1FDjocRs4rBXN?=
 =?us-ascii?Q?eSKYnFn2/ih0QOraYTWVXiCFeq1vZBTkV3zjNJGMfwh7DmZtY4PJOdwCquad?=
 =?us-ascii?Q?reEzh1JtSbz9Gn1zFdkfoxrUXbQAIFdtvoLcVFrb17Q9jORRydNsTY3A2Axs?=
 =?us-ascii?Q?KXONB2mwmhchVTWt2OfJ+LaQ2uIiFSueask9VlZTRdHZG8LqOEtSXaw0n3VD?=
 =?us-ascii?Q?ClsD0l+Qk+/EdZN3EiKRXOvy9HWX9rQ7HTzl4AT9HwAsDM8vP7vk/+ndhIVm?=
 =?us-ascii?Q?POlJPDXdDZbbIiGeyrKyg2y2h9mn5s+Z9yigGbznaEs2yF/f3jb5qLyWkuwZ?=
 =?us-ascii?Q?iBvmVs9JCbcTqjucvRmq48mBjZRRhutADw+TxIZHcQgCADtjp7si5Pxc+Q+n?=
 =?us-ascii?Q?1zPBVswFKubz0xBohJ9fMfQbUD1kW/xm/ykMvXMcewHqtVK5GRS7VUGdrCNy?=
 =?us-ascii?Q?v/yV5d+fvK7ZM3hpydAbT1/zqCftQuCSKhGXeuSb7NIo/7Rb2Q3a/4mNC4k8?=
 =?us-ascii?Q?3s9P2KHAhIXwqXicOyfFhFIPwfw4NQ2vm3iLaJdDlL1S+4zWKDdKXtDsz7Og?=
 =?us-ascii?Q?TXsXdiJcDxTLuDfsoRA6nYZWH4xSEFq85MuB6wKXybkhwk7Eja8pOvLtRQgv?=
 =?us-ascii?Q?XJVhzhXsq0MLmjUQ+RPoDVxa0tLku+XNCiwY6ZXcKmv08R14XaZBecdEiCoF?=
 =?us-ascii?Q?/uVZRT+29beb6WYLp3hhDX58UzVIUeLZQFkxXY3d7Q8hmS2bh+rwDsq7RX/V?=
 =?us-ascii?Q?F9vC3mpH3P26lJmL9JQRB5DvwMpB1xXna26uZeQySL47P7WWu/gQtHu3pceT?=
 =?us-ascii?Q?8LwcKHrptfHxyUPwXECyHxHOLSmQj3z7hFbBiFJ2Y+4My9pNo9XIUCzmoI8j?=
 =?us-ascii?Q?9OhNiACdfkxADpkId3X0gtbp9zgO8IPEnPr2xQiub8gk3SIbcxmmVIVRDyma?=
 =?us-ascii?Q?88NPscrxFFGR/Z6Gr8c3UWnvSLb5+yXuudFcWkHVnsoZYRz31j5VlVlZDh4C?=
 =?us-ascii?Q?1NWB5kMaY8szS2E8UJ7tshGRwGnj0og97FXo/SFgUa0+k6WDexoHRVyWUs8P?=
 =?us-ascii?Q?d6D4XOYWFe0N8Fi4p1gOTDz2+pSI/Sio5txT9BUURXkFKf1VQz5ZLj48OtqC?=
 =?us-ascii?Q?oh4vx4dZ1oCKkoQWAC7d+g8tyxMDyxzLLRGczTT/iF33QMWrDpfW/icc0/va?=
 =?us-ascii?Q?2GAMvhVA6MkSHAru05oQLwbL4Toq+NdNLndOVbskNTDftCyJ1mrqmj5yT55G?=
 =?us-ascii?Q?Bur95OracQJCwIpgE9B/kR44x5Uk4sPUikBSmXyuZshGwIlgGva+RNqxHZDw?=
 =?us-ascii?Q?6+4OPU3rB6Nvis5al5gWEC+kHkwGlcWW26dy/OM0Nua7sqZZ7qn0vOzX27BM?=
 =?us-ascii?Q?eSQnNwgz0PjyPYFUtSRHKEtx29GIK/rmr2SgPf6ph4sX6Ovxda5o1cy3HkgV?=
 =?us-ascii?Q?7lhUDWB1QZPBuqQO8KziqXZ53EcRcMlaTPAF7Ev4/8YSfr/GYVq7SVrWj34i?=
 =?us-ascii?Q?8JZ9kWM5Gnba5RPRjrTuKCxnREa+CR0Hj1F/p2GN?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?DWhheqpYwlB+5O0grkfpH+5uDemwYxOBAns12fBbI9kwNK5twgw6R633ljzV?=
 =?us-ascii?Q?5B2Cis87D7uDawU4xssUqFBSqcvBqJaP6ij11NDyAcvcFeqGNr4dsxOfuzFl?=
 =?us-ascii?Q?QYOwT1vj4AV6IMEnOmpCCrCLvcLlV3wPHGenDc7ygZ3xuHu9ttN09qTVUStf?=
 =?us-ascii?Q?HrmgkRzRlaxhavcXc/syrBOqU7hboqO501ElxfzJuuChjiZj61E61fEqdl2l?=
 =?us-ascii?Q?+sO0K7PRH/lNm3p2XTPGiQn/pWVreBjXFzCW/BuBHUBWUCrWvChvVYRu6Ctc?=
 =?us-ascii?Q?7W/91p69Oow+GBUO8+4Aerktdloh4N+cU1jlccHY56YbK7+6DpfIs7swBaVN?=
 =?us-ascii?Q?wo5YDNps48ogVmgFYjZUyk9JtcMAgPKuWgP124ldn5Ml4nluSyaKb48TgCjP?=
 =?us-ascii?Q?HkLRO+ExcheJtVt5Vsc6OhRAFf3T/oLeMOBXfX8DaC8R4JGwvy46l9mCcx5+?=
 =?us-ascii?Q?/faTBzG6XisG7aNbLd25lzOXlDTG/HLOQn899p2Uga0p++Q7SY+zueZgfEBC?=
 =?us-ascii?Q?Mmv+C0dhoc/l/EQrZiMwKX8AshMy8iGWYYkNSO09n6nvFihU4risXFkfV4Cb?=
 =?us-ascii?Q?ST8efb/zXos8ic5u7OmfnjJhrBJ+fqrH9aA/Ye+vNvgwyvEWLZXaYLIt1xlU?=
 =?us-ascii?Q?VpJRRduMj6opXMAomVenRNcDgLeLKjwqNPpKcFs6NUmzZN2U52eJMacJO6Tj?=
 =?us-ascii?Q?8YLbjsJGnR2uABq7ETRIze9BZ0ZtGHUJWVoCHX2Ke0UcuFMwzaXX3zAvFSWG?=
 =?us-ascii?Q?JRH5GTNxc7F7tSyOPEsvapDcPqGZE87BwT9E1J1OwTrwMDz5LRZVDO3b1LfQ?=
 =?us-ascii?Q?ytD6Hs1wYRG9hLUEVrY6WkE9VbiOgOVpMWzgySw4PbR87soLkTqR9ppXSaEb?=
 =?us-ascii?Q?lIvSgDvePpuzbkPgTIIq+sBPa/+yfRegpZjofh8sunZNkw/cmQ4lurseqQ9+?=
 =?us-ascii?Q?arTfF3WcmTDG+SJdbXpNeLFub7E6e7yxqpx5HjJV1BNpJVXL3Kxvuf8DnkWl?=
 =?us-ascii?Q?9aYpwxzJS+ymwaEymDURg7Fqf/Th50G4R4238gueD9mRW/0fg0icYTGldfoZ?=
 =?us-ascii?Q?IG+lg/aR6136BRsCPJnOya2XUNU9bUqiSxXklYKZK/2wy9GfGobJ4cXcCY6a?=
 =?us-ascii?Q?C0/EqRJw7HQdBc3TWJAyT00jWSaHTiOnahC/3dfAZqseLfaJ2Zk1+E7nUcf1?=
 =?us-ascii?Q?zD0hmliJiZzdMjm8D7czoqKCsEddbh5IiYNobJsDSnYOI/05QIsfvEux3EwD?=
 =?us-ascii?Q?Dfl4ymUoL15i8gsu3weBjZCmXDrDiWA+U12Ps7lV8s8lIsPquhWivhVsErwn?=
 =?us-ascii?Q?6St6tzyBWF4BwRrMtd5KGdKD/EKJxUW81e2aWRI9eWTVBf43Ey9+uF1zk2TO?=
 =?us-ascii?Q?azNsWJPl/dIATWfeYfGSnkW3UIlH4d+OJyh7MwFTKLyghpTThOxmiGUakFez?=
 =?us-ascii?Q?3WHPfTcv/giRsK8sWL8XAdk+3ivj6Dz1lLrmX64h+oylklsYVOiFsm56t3AG?=
 =?us-ascii?Q?YMokjoNOr2p1x57IBqAwiK9CDdrb4tsMb9w83F/RdPREPAaKeUdOimoD9aeR?=
 =?us-ascii?Q?9vv8/S3oHa2l6WAtL9J93CcZDtSSWPtNBl7X0P9mwiuN1IWmnnAhdnbj3PUc?=
 =?us-ascii?Q?cN3em8Jk1U1ibTkojtGn8FouqKtz+k64AEhkfWrRpcfCYR7J398P3cPd2P5P?=
 =?us-ascii?Q?6WRCVNfNv/Ek7BgQqQFaK5Y59ydfg4pnaHnMiT3M1c2dEIy7knBfZLaPm9RA?=
 =?us-ascii?Q?UQ+ndLUHNXCS6f4JWE7RnTPt4ngHuTqAyURFfCI60l/gH7dyCMCBb3aWPzUM?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: jC7h/Pbldw4dNg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4b73035-fb9d-46a4-cb35-08da7b94afee
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 12:26:16.7603 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 10Q/m3pcp1LWdwywVgkJ47alZtOyrN02EHJNhzC8YB7wehN/qGR0MBhkb9dbzxVqxOP42s4AGlzK8IOBzVhAhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5846
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_05,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 suspectscore=0 adultscore=0 phishscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208110038
X-Proofpoint-GUID: BqN9ZHkuXB8Zw0Wp7CR-hcFj7VfYQVcb
X-Proofpoint-ORIG-GUID: BqN9ZHkuXB8Zw0Wp7CR-hcFj7VfYQVcb
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series introduces new QMP/HMP commands to dump the status of a
virtio device at different levels.

[Jonah: Rebasing from previous patchset from Apr. 1 (v14). Original patches
 are by Laurent Vivier from May 2020.

 I sincerely apologize for the *massive* delay in getting this latest v15
 series out. It was a perferct storm of other more pressing issues, time off,
 and trying to understand why I was seeing this 30 feature bit in my PCI virtio
 devices. Please see patch 3/6 for more explanation on this issue.

 Rebase from v14 to v15 includes: adding the missing sign-off-by from the poster,
 renaming & moving all virtio device feature map definitions to hw/virtio/virtio.c,
 including brief descriptions for all status & feature bits, a new virtio device
 feature map defined for virtio-rng, and mappings for virtio/vhost-vsock,
 virtio-iommu, virtio-mem, and virtio transport features updated with their
 newest feature bits. Most of these changes can be found in patch 3/6.

 And again, sorry for the long wait on this.]


1. List available virtio devices in the machine

HMP Form:

    info virtio

    Example:

        (qemu) info virtio
        /machine/peripheral-anon/device[2]/virtio-backend [virtio-scsi]
        /machine/peripheral/vsock0/virtio-backend [vhost-vsock]
        /machine/peripheral/crypto0/virtio-backend [virtio-crypto]
        /machine/peripheral-anon/device[1]/virtio-backend [virtio-net]
        /machine/peripheral-anon/device[0]/virtio-backend [virtio-serial]

QMP Form:

    { 'command': 'x-query-virtio',
      'returns': ['VirtioInfo'],
      'features': [ 'unstable' ] }

    Example:

        -> { "execute": "x-query-virtio" }
        <- { "return": [
                 {
                     "name": "virtio-scsi",
                     "path": "/machine/peripheral-anon/device[2]/virtio-backend"
                 },
                 {
                     "name": "vhost-vsock",
                     "path": "/machine/peripheral/vsock0/virtio-backend"
                 },
                 {
                     "name": "virtio-crypto",
                     "path": "/machine/peripheral/crypto0/virtio-backend"
                 },
                 {
                     "name": "virtio-net",
                     "path": "/machine/peripheral-anon/device[1]/virtio-backend"
                 },
                 {
                     "name": "virtio-serial",
                     "path": "/machine/peripheral-anon/device[0]/virtio-backend"
                 }
             ]
           }

2. Display status of a given virtio device

HMP Form:

    info virtio-status <path>

    Example:

        (qemu) info virtio-status /machine/peripheral/vsock0/virtio-backend
        /machine/peripheral/vsock0/virtio-backend:
          device_name:             vhost-vsock (vhost)
          device_id:               19
          vhost_started:           true
          bus_name:                (null)
          broken:                  false
          disabled:                false
          disable_legacy_check:    false
          started:                 true
          use_started:             true
          start_on_kick:           false
          use_guest_notifier_mask: true
          vm_running:              true
          num_vqs:                 3
          queue_sel:               2
          isr:                     0
          endianness:              little
          status:
        	VIRTIO_CONFIG_S_ACKNOWLEDGE: Valid virtio device found,
	        VIRTIO_CONFIG_S_DRIVER: Guest OS compatible with device,
	        VIRTIO_CONFIG_S_FEATURES_OK: Feature negotiation complete,
	        VIRTIO_CONFIG_S_DRIVER_OK: Driver setup and ready
          Guest features:
	        VIRTIO_RING_F_EVENT_IDX: Used & avail. event fields enabled,
	        VIRTIO_RING_F_INDIRECT_DESC: Indirect descriptors supported,
	        VIRTIO_F_VERSION_1: Device compliant for v1 spec (legacy)
          Host features:
	        VIRTIO_RING_F_EVENT_IDX: Used & avail. event fields enabled,
	        VIRTIO_RING_F_INDIRECT_DESC: Indirect descriptors supported,
	        VIRTIO_F_VERSION_1: Device compliant for v1 spec (legacy),
	        VIRTIO_F_ANY_LAYOUT: Device accepts arbitrary desc. layouts,
	        VIRTIO_F_NOTIFY_ON_EMPTY: Notify when device runs out of avail. descs. on VQ
	        VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features negotiation supported
          Backend features:

          VHost:
              nvqs:           2
              vq_index:       0
              max_queues:     0
              n_mem_sections: 4
              n_tmp_sections: 4
              backend_cap:    0
              log_enabled:    false
              log_size:       0
              Features:
	          VIRTIO_RING_F_EVENT_IDX: Used & avail. event fields enabled,
	          VIRTIO_RING_F_INDIRECT_DESC: Indirect descriptors supported,
	          VIRTIO_F_VERSION_1: Device compliant for v1 spec (legacy),
	          VIRTIO_F_ANY_LAYOUT: Device accepts arbitrary desc. layouts,
	          VIRTIO_F_NOTIFY_ON_EMPTY: Notify when device runs out of avail. descs. on VQ
	          VHOST_F_LOG_ALL: Logging write descriptors supported
              Acked features:
	          VIRTIO_RING_F_EVENT_IDX: Used & avail. event fields enabled,
	          VIRTIO_RING_F_INDIRECT_DESC: Indirect descriptors supported,
	          VIRTIO_F_VERSION_1: Device compliant for v1 spec (legacy)
              Backend features:

              Protocol features:

QMP Form:

    { 'command': 'x-query-virtio-status',
      'data': { 'path': 'str' },
      'returns': 'VirtioStatus',
      'features': [ 'unstable' ] }

    Example:

        -> { "execute": "x-query-virtio-status",
             "arguments": { "path": "/machine/peripheral/vsock0/virtio-backend" }
           }
        <- { "return": {
                 "device-endian": "little",
                 "bus-name": "",
                 "disable-legacy-check": false,
                 "name": "vhost-vsock",
                 "started": true,
                 "device-id": 19,
                 "vhost-dev": {
                     "n-tmp-sections": 4,
                     "n-mem-sections": 4,
                     "max-queues": 0,
                     "backend-cap": 0,
                     "log-size": 0,
                     "backend-features": {
                         "dev-features": [
                         ],
                         "transports": [
                         ]
                     },
                     "nvqs": 2,
                     "protocol-features": {
                         "protocols": [
                         ]
                     },
                     "vq-index": 0,
                     "log-enabled": false,
                     "acked-features": {
                         "dev-features": [
                         ],
                         "transports": [
                             "VIRTIO_RING_F_EVENT_IDX: Used & avail. event fields enabled",
                             "VIRTIO_RING_F_INDIRECT_DESC: Indirect descriptors supported",
                             "VIRTIO_F_VERSION_1: Device compliant for v1 spec (legacy)"
                         ]
                     },
                     "features": {
                         "dev-features": [
                             "VHOST_F_LOG_ALL: Logging write descriptors supported"
                         ],
                         "transports": [
                             "VIRTIO_RING_F_EVENT_IDX: Used & avail. event fields enabled",
                             "VIRTIO_RING_F_INDIRECT_DESC: Indirect descriptors supported",
                             "VIRTIO_F_VERSION_1: Device compliant for v1 spec (legacy)",
                             "VIRTIO_F_ANY_LAYOUT: Device accepts arbitrary desc. layouts",
                             "VIRTIO_F_NOTIFY_ON_EMPTY: Notify when device runs out of avail. descs. on VQ"
                         ]
                     }
                 },
                 "backend-features": {
                     "dev-features": [
                     ],
                     "transports": [
                     ]
                 },
                 "start-on-kick": false,
                 "isr": 0,
                 "broken": false,
                 "status": {
                     "statuses": [
                         "VIRTIO_CONFIG_S_ACKNOWLEDGE: Valid virtio device found",
                         "VIRTIO_CONFIG_S_DRIVER: Guest OS compatible with device",
                         "VIRTIO_CONFIG_S_FEATURES_OK: Feature negotiation complete",
                         "VIRTIO_CONFIG_S_DRIVER_OK: Driver setup and ready"
                     ]
                 },
                 "num-vqs": 3,
                 "guest-features": {
                     "dev-features": [
                     ],
                     "transports": [
                         "VIRTIO_RING_F_EVENT_IDX: Used & avail. event fields enabled",
                         "VIRTIO_RING_F_INDIRECT_DESC: Indirect descriptors supported",
                         "VIRTIO_F_VERSION_1: Device compliant for v1 spec (legacy)"
                     ]
                 },
                 "host-features": {
                     "dev-features": [
                         "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features negotiation supported"
                     ],
                     "transports": [
                         "VIRTIO_RING_F_EVENT_IDX: Used & avail. event fields enabled",
                         "VIRTIO_RING_F_INDIRECT_DESC: Indirect descriptors supported",
                         "VIRTIO_F_VERSION_1: Device compliant for v1 spec (legacy)",
                         "VIRTIO_F_ANY_LAYOUT: Device accepts arbitrary desc. layouts",
                         "VIRTIO_F_NOTIFY_ON_EMPTY: Notify when device runs out of avail. descs. on VQ"
                     ]
                 },
                 "use-guest-notifier-mask": true,
                 "vm-running": true,
                 "queue-sel": 2,
                 "disabled": false,
                 "vhost-started": true,
                 "use-started": true
             }
           }

3. Display status of a given virtio queue

HMP Form:

    info virtio-queue-status <path> <queue>

    Example:

        (qemu) info virtio-queue-status /machine/peripheral-anon/device[1]/virtio-backend 2
        /machine/peripheral-anon/device[1]/virtio-backend:
          device_name:          virtio-net
          queue_index:          2
          inuse:                0
          used_idx:             15
          signalled_used:       15
          signalled_used_valid: true
          VRing:
            num:          64
            num_default:  64
            align:        4096
            desc:         0x000000011e15c000
            avail:        0x000000011e15c400
            used:         0x000000011e15c4c0

QMP Form:

    { 'command': 'x-query-virtio-queue-status',
      'data': { 'path': 'str', 'queue': 'uint16' },
      'returns': 'VirtQueueStatus',
      'features': [ 'unstable' ] }

    Example:

        -> { "execute": "x-query-virtio-queue-status",
             "arguments": { "path": "/machine/peripheral-anon/device[1]/virtio-backend",
                            "queue": 2 }
           }
        <- { "return": {
                 "signalled-used": 15,
                 "inuse": 0,
                 "name": "virtio-net",
                 "vring-align": 4096,
                 "vring-desc": 4814004224,
                 "signalled-used-valid": true,
                 "vring-num-default": 64,
                 "vring-avail": 4814005248,
                 "queue-index": 2,
                 "vring-used": 4814005440,
                 "used-idx": 15,
                 "vring-num": 64
             }
           }

4. Display status of a given vhost queue

HMP Form:

    info virtio-vhost-queue-status <path> <queue>

    Example:

        (qemu) info virtio-vhost-queue-status /machine/peripheral-anon/device[1]/virtio-backend 1
        /machine/peripheral-anon/device[1]/virtio-backend:
          device_name:          virtio-net (vhost)
          kick:                 0
          call:                 0
          VRing:
            num:         256
            desc:        0x00007f804df5a000
            desc_phys:   0x000000013315a000
            desc_size:   4096
            avail:       0x00007f804df5b000
            avail_phys:  0x000000013315b000
            avail_size:  518
            used:        0x00007f804df5b240
            used_phys:   0x000000013315b240
            used_size:   2054

QMP Form:

    { 'command': 'x-query-virtio-vhost-queue-status',
      'data': { 'path': 'str', 'queue': 'uint16' },
      'returns': 'VirtVhostQueueStatus',
      'features': [ 'unstable' ] }

    Example:

        -> { "execute": "x-query-virtio-vhost-queue-status",
             "arguments": { "path": "/machine/peripheral-anon/device[1]/virtio-backend",
                            "queue": 1 }
           }
        <- { "return": {
                 "avail-phys": 4803538944,
                 "name": "virtio-net",
                 "used-phys": 4803539520,
                 "avail-size": 518,
                 "desc-size": 4096,
                 "used-size": 2054,
                 "desc": 140186477404160,
                 "num": 256,
                 "call": 0,
                 "avail": 140186477408256,
                 "desc-phys": 4803534848,
                 "used": 140186477408832,
                 "kick": 0
             }
           }

5. Display an element of a given virtio queue

HMP Form:

    info virtio-queue-element <path> <queue> [index]

    Example:

        Dump the information of the head element of the third queue of virtio-scsi:

        (qemu) info virtio-queue-element /machine/peripheral-anon/device[2]/virtio-backend 2
        /machine/peripheral-anon/device[2]/virtio-backend:
          device_name: virtio-scsi
          index:   0
          desc:
            descs:
                addr 0x128890000 len 12288 (write),
                addr 0x128880000 len 65536 (write, next),
                addr 0x128870000 len 65536 (write, next),
                addr 0x128860000 len 65536 (write, next),
                addr 0x128850000 len 65536 (write, next),
                addr 0x128840000 len 65536 (write, next),
                addr 0x128830000 len 65536 (write, next),
                addr 0x128820000 len 65536 (write, next),
                addr 0x128810000 len 65536 (write, next),
                addr 0x128800000 len 65536 (write, next),
                addr 0x116bf3000 len 53248 (write, next),
                addr 0x116be3000 len 65536 (write, next),
                addr 0x116bd3000 len 65536 (write, next),
                addr 0x116bc3000 len 65536 (write, next),
                addr 0x116bb3000 len 65536 (write, next),
                addr 0x116ba3000 len 65536 (write, next),
                addr 0x116b93000 len 65536 (write, next),
                addr 0x116b83000 len 65536 (write, next),
                addr 0x116b73000 len 65536 (write, next),
                addr 0x116b63000 len 65536 (write, next),
                addr 0x116b53000 len 65536 (write, next),
                addr 0x126e9763b len 108 (write, next),
                addr 0x9af8dae7222881a2 len 51 (next)
          avail:
            flags: 0
            idx:   600
            ring:  0
          used:
            flags: 0
            idx:   600

QMP Form:

    { 'command': 'x-query-virtio-queue-element',
      'data': { 'path': 'str', 'queue': 'uint16', '*index': 'uint16' },
      'returns': 'VirtioQueueElement',
      'features': [ 'unstable' ] }

    Example:

        -> { "execute": "x-query-virtio-queue-element",
             "arguments": { "path": "/machine/peripheral-anon/device[2]/virtio-backend",
                            "queue": 2 }
           }
        <- { "return": {
                 "index": 1,
                 "name": "virtio-scsi",
                 "descs": [
                     {
                         "flags": ["write"],
                         "len": 65536,
                         "addr": 4852740096
                     },
                     {
                         "flags": ["write", "next"],
                         "len": 65536,
                         "addr": 4852674560
                     },
                     {
                         "flags": ["write", "next"],
                         "len": 65536,
                         "addr": 4852609024
                     },
                     {
                         "flags": ["write", "next"],
                         "len": 65536,
                         "addr": 4852543488
                     },
                     {
                         "flags": ["write", "next"],
                         "len": 65536,
                         "addr": 4852477952
                     },
                     {
                         "flags": ["write", "next"],
                         "len": 65536,
                         "addr": 4852412416
                     },
                     {
                         "flags": ["write", "next"],
                         "len": 65536,
                         "addr": 4852346880
                     },
                     {
                         "flags": ["write", "next"],
                         "len": 65536,
                         "addr": 4852281344
                     },
                     {
                         "flags": ["write", "next"],
                         "len": 65536,
                         "addr": 4852215808
                     },
                     {
                         "flags": ["write", "next"],
                         "len": 65536,
                         "addr": 4852150272
                     },
                     {
                         "flags": ["write", "next"],
                         "len": 65536,
                         "addr": 4852084736
                     },
                     {
                         "flags": ["write", "next"],
                         "len": 65536,
                         "addr": 4852019200
                     },
                     {
                         "flags": ["write", "next"],
                         "len": 65536,
                         "addr": 4851953664
                     },
                     {
                         "flags": ["write", "next"],
                         "len": 65536,
                         "addr": 4851888128
                     },
                     {
                         "flags": ["write", "next"],
                         "len": 65536,
                         "addr": 4851822592
                     },
                     {
                         "flags": ["write", "next"],
                         "len": 65536,
                         "addr": 4851757056
                     },
                     {
                         "flags": ["write", "next"],
                         "len": 65536,
                         "addr": 4851691520
                     },
                     {
                         "flags": ["write", "next"],
                         "len": 65536,
                         "addr": 4851625984
                     },
                     {
                         "flags": ["write", "next"],
                         "len": 65536,
                         "addr": 4851560448
                     },
                     {
                         "flags": ["write", "next"],
                         "len": 65536,
                         "addr": 4851494912
                     },
                     {
                         "flags": ["write", "next"],
                         "len": 108,
                         "addr": 4801325435
                     },
                     {
                         "flags": ["next"],
                         "len": 51,
                         "addr": 12075758188190198449
                     }
                 ],
                 "avail": {
                     "idx": 922,
                     "flags": 0,
                     "ring": 1
                 },
                 "used": {
                     "idx": 922,
                     "flags": 0
                 }
             }
           }

v15: added missing sign-off in patches
     rebased for upstream (Qemu 7.1)
     minor reformatting to examples in qapi/virtio.json
     virtio device feature maps moved to hw/virtio/virtio.c
     virtio device feature maps renamed (less generic)
     virtio device feature maps now include brief description of feature
     virtio device status map now include brief description of status
     new feature bits added to mappings for virtio/vhost-vsock,
     virtio-iommu, & virtio-mem
     new virtio transport feature bit added to mapping
     new virtio device feature map defined for virtio-rng

v14: move definition of 'gpu_map' to virtio-gpu.c
     add new 'context-init' virtio-gpu feature
     created new feature map 'i2c_map' for vhost-user-i2c
     fixed casting error for cross-Win64 builds

v13: minor text edit in qapi/virtio.json

v12: minor reformatting for monitor/hmp-cmds.c
     use PRI types in virtio hmp monitor printfs

v11: minor reformatting in virtio.json
     added synchronicity check when querying virtio devices

v10: rebased for upstream (Qemu 7.0)
     reformat virtio.json for better consistency
     removed all enums from virtio.json; replaced with string literals
     removed @ndescs from VirtioQueueElement
     removed examples in hmp-commands-info.hx (to fix 'inconsistent
     literal block quoting' error from Sphinx)

v9: rebased for upstream (Qemu 6.3)
    change QMP command prefixes from 'x-debug-virtio' to
    'x-query-virtio'
    add 'unstable' feature to all 'x-query-virtio' prefixed
    QMP commands
    fix odd indentation for qapi/virtio.json
    device features support for virtio-mem
    move HMP sub-commands under 'virtio' top level to 'info'
    top level

v8: add assert in virtio_id_to_name() to make sure we're
    not returning NULL
    minor documentation additions to qapi/virtio.json
    add virtio introspection support for vhost-user-rng

v7: rebased for upstream (Qemu 6.2)
    add ability to map between numberic device ID and
    string device ID (name) for virtio devices
    add get_vhost() callback function for VirtIODevices
    expose more fields of VirtIODevice
    expose fields of vhost devices
    decode vhost user protocol features
    decode VirtIODevice configuration statuses
    vhost support for displaying virtio queue statuses
    vhost support for displaying vhost queue statuses
    expose driver and device areas when introspecting a
    virtio queue element
    changed patch attribution

v6: rebased for upstream (Qemu 6.1)
    add all virtio/vhost types in same order as
    include/standard-headers/linux/virtio_ids.h
    use QAPI_LIST_PREPEND in qmp_x_debug_query_virtio rather than open
    coding

v5: rebased for upstream
    add device name, used index, and relative indicies to virtio queue-status
    HMP command
    add device name to virtio queue-status QMP command
    add new virtio device features

v4: re-send series as v3 didn't reach qemu-devel

v3: use qapi_free_VirtioInfoList() on the head of the list, not on the tail.
    Prefix the QMP commands with 'x-debug-'

v2: introduce VirtioType enum
    use an enum for the endianness
    change field names to stick to naming convertions (s/_/-/)
    add a patch to decode feature bits
    don't check if the queue is empty to allow display of old elements
    use enum for desc flags
    manage indirect desc
    decode device features in the HMP command

Laurent Vivier (6):
  qmp: add QMP command x-query-virtio
  qmp: add QMP command x-query-virtio-status
  qmp: decode feature & status bits in virtio-status
  qmp: add QMP commands for virtio/vhost queue-status
  qmp: add QMP command x-query-virtio-queue-element
  hmp: add virtio commands

 hmp-commands-info.hx       |   70 +++
 hw/virtio/meson.build      |    2 +
 hw/virtio/virtio-stub.c    |   42 ++
 hw/virtio/virtio.c         | 1032 ++++++++++++++++++++++++++++++++++++
 include/hw/virtio/vhost.h  |    3 +
 include/hw/virtio/virtio.h |    6 +
 include/monitor/hmp.h      |    5 +
 monitor/hmp-cmds.c         |  310 +++++++++++
 qapi/meson.build           |    1 +
 qapi/qapi-schema.json      |    1 +
 qapi/virtio.json           |  954 +++++++++++++++++++++++++++++++++
 tests/qtest/qmp-cmd-test.c |    1 +
 12 files changed, 2427 insertions(+)
 create mode 100644 hw/virtio/virtio-stub.c
 create mode 100644 qapi/virtio.json

-- 
2.31.1


