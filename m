Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C3967D12D
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 17:19:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL4xy-0008HX-4C; Thu, 26 Jan 2023 11:19:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1pL4xr-0008Gq-Ga
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 11:19:03 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1pL4xo-0005oH-Ri
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 11:19:02 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30QGFvlq002855; Thu, 26 Jan 2023 16:18:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2022-7-12;
 bh=QfQMJSdjxwAv6mT53wkjIXgFAKgBbvBh9QdrAurqJgU=;
 b=odNnmGRaJhB8t97UOYy4e2MVKMVpCv5DUQ6JGDo1MJdEkLWOOzUab4ZXfFNyTVmSCsrF
 bRykwBZp/7ExyHykMzv3m+znrs3WEGxkR9MGTNNUvbf5+Vv7nTgUpp3Caae0j6xR5WBa
 XND/5yI221Lg6APiaiH87PSRsSgm+mBa+iReq06VYSdZ0yvMwylStUKgJLOJPJ+NkIEg
 IbvrQEGu7ZtS3XPDk8Fcqe70PMnUAqYOOgkrX/4omIXRbGscP3xYYJtAjSzxPzJALYaJ
 ESoZGG0PKWKdCi+O/qzP3vRRpnPja1HHWu/p77WXJsRUDU7wNd7kD6BXXCxLQGpJZsKp 4A== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3n86u32r3y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Jan 2023 16:18:53 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 30QFia2i006214; Thu, 26 Jan 2023 16:18:52 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3n86gewe6j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Jan 2023 16:18:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OMEN+AELn4XQMc62fXmEX2AhXakZatc3hu2/GcoH+JmDfKgWLXQfOvAaIN07E3xW0npnsQwF5a3dSSZ3JXE9eB4KSsEHGrZt8PMx4tSKtoR4CEWi6mjYKzo9l/aFupjIHtGo0eRMEklYnXS1pg5r5loJkKJ8bTNiyhqRfKkN3+v9LE8ZKrntOgfeXvUIxJTukNat2azoJtoUtQq61yZaI3Ub9TJt/eU6lkHe5qkNRJlj3SmViAXG2PB6OPAPr1xFoyBUPELLuDErPCRkf1hAxOJGRVg5a6wPL8yJwP+rFlASCdIOECUVUmkjH2d9NcZsES0HSySNDwjj8FXdXYqinw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QfQMJSdjxwAv6mT53wkjIXgFAKgBbvBh9QdrAurqJgU=;
 b=oLZfsWOD5sq7YafVQV7tBCSDaDc3hIyEVAT6brHoIIV/csuloInhLwrLxCB5CTClvjfD1WMyqrv7RfSbHw05n3bBXsmfo8A4vCLO2GEBt63ulnRhPqTouQMQPUXNdYojZINHdAxfMVQ11byatW714dE7f91nTGLD9XamNfelkM9Kpjic4s7kRzpv4HRIBo4ac78XSoYP+cUKyxLU9lj+CiEYcx6ZiUOkUcMswDiBdOFn4NcnUTVD9Rwx8lARugiTGwzAnWrRijHKvOyO6LFtmyhobSKUVaYDHT5yi51y3gV6fwaP+zuIDhvpCe7FbfkLdpWqUTZWAkgudPiZRgmPOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QfQMJSdjxwAv6mT53wkjIXgFAKgBbvBh9QdrAurqJgU=;
 b=fkb5W4doYK9wDP3rCjpcmC+a9sqwmmyW6TiBxrGAE2FgKWkqugnyRBibmkyJTj+PiLbHXzB0+L6mV2e8cC0NJPeP5tbfsm8MUvLNJajFbZ+Bz9GD36HMIgr9dviQdYEiBNtRsysNpXaPECgm+oiA84JCFbTxw9QoWqtmhhBEjUg=
Received: from BLAPR10MB5138.namprd10.prod.outlook.com (2603:10b6:208:322::8)
 by MN6PR10MB7490.namprd10.prod.outlook.com (2603:10b6:208:47d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Thu, 26 Jan
 2023 16:18:51 +0000
Received: from BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::8a7d:60c:7965:98c3]) by BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::8a7d:60c:7965:98c3%5]) with mapi id 15.20.6043.017; Thu, 26 Jan 2023
 16:18:50 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Mauro
 Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>, Jason
 Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>, Gerd
 Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>, Laurent
 Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>, "Edgar E .
 Iglesias" <edgar.iglesias@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, Eduardo
 Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>
Subject: Re: [PATCH v5 0/4] memory: prevent dma-reentracy issues
In-Reply-To: <20230126052558.572634-1-alxndr@bu.edu>
References: <20230126052558.572634-1-alxndr@bu.edu>
Date: Thu, 26 Jan 2023 16:18:46 +0000
Message-ID: <m2cz71jml5.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0091.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::26) To BLAPR10MB5138.namprd10.prod.outlook.com
 (2603:10b6:208:322::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5138:EE_|MN6PR10MB7490:EE_
X-MS-Office365-Filtering-Correlation-Id: dd673e21-9803-4b42-0fb8-08daffb902a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AkhRaZ/YPcyPpxaxDnKFkPBtNyNAl1YRghl2MPi1NGRRekFvO8GQJf1VzY3I524S8DUYnwf7s+G2I+JtDLW3mBtUjUIUHDSzQPfyXBvo3ZPieirdfMH3Y4HJHub0nv5A5l/UpbQKmCYhwWOHg4rAYoFa8XBk0PtClNiLHk6oTfBM25DEeKb42FA9qNPQ2AxSQgqYG9ImVOHcV4wijLk1VLip+5QUbevRyGIlArW3+Jp457GIbnG7qZHqxurIngIEo99zJwuJRSLI33ItOEr20gz3Jrb97jiwrT0N4yBaNswMdLzo0lZao7w2z3XV+TgONGCdzs0PqZiQ5E4BBnr5bJ6QGOdY4vo6Z1dwdFiRYiMS0W//zMTOAJLbVnzd1x0YUmB28Jl+LktY1BcE25yxKK0NFWL9EbJAWHqh/muF03geHBufy3hybWOpn7H8tFJRDeBLj11qNl2loGCIqVyeoKiqU/HL4i4gxjaUusS3/XP1+qNhTWj6CKytaHl9OU47+jsOzNYmaxRZLzeMIgywHF1sPzH33FUAOIZk5E94XSj0wfpTmjAlZVsGU7R8fz4En9MnCPMjTvOOKLKpMmZ9qgpFUINLWgj1cDVbjEvDYgu7afKgJfLCItqQctKTWX8z7xLaWSsakT41EkHnNmekqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5138.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(346002)(366004)(376002)(136003)(39860400002)(451199018)(2906002)(36756003)(6506007)(186003)(26005)(6512007)(7416002)(44832011)(5660300002)(8936002)(4326008)(316002)(66476007)(66946007)(66556008)(41300700001)(8676002)(86362001)(54906003)(6486002)(38100700002)(478600001)(6666004)(2616005)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ElSei3Bm73Z44BfwkmErU0iGLrsT/YAn3GPrerTE8BQ4JCm082I+WISKcc1u?=
 =?us-ascii?Q?/k48Ao1piCXpvgf4VkW/FzJtTuS8laGAGxCLn8fHwlS8UtwgWyfB1B95a10p?=
 =?us-ascii?Q?Eo1ozITZDM7K3xRJ8GgH6VD5PZD1lw4iHp1z7JIdlAio92q3sk1EAtVo/e+P?=
 =?us-ascii?Q?VfxN8wGVFjWxJwb/cgqHr6TlHa8AijhkOlOQe45NmbPgMxpfO3KNdMd2ZfS4?=
 =?us-ascii?Q?quqdfXAQQH5QNBf8JLxOGXovMC/rtIlMEA8dGvqtCr2zen7KcE3v3X9TIqKO?=
 =?us-ascii?Q?XfkE/0vmwCzBpIpfRAADkqkIMrQnSHQ8tR4K0jraWoE+WzDRYYoX7viJmo+I?=
 =?us-ascii?Q?TFn7M4rsVwEOILHPiRvtxmLBlGEq/zcQT90JpsG61PTc+u2nns5M5m6sc8sC?=
 =?us-ascii?Q?3K2bi3VYfeX5hpy/URi/rfWYhoeD5SqB7SNBC7Mx1cH+pxsda28XwQqHG+mx?=
 =?us-ascii?Q?vp7WG7+mjwVE3zwpgA2UIypGKMmIt9X7c269RUfnrr7TFW0HbM8vOiqTM/Bw?=
 =?us-ascii?Q?tF1njfSIFyVxjpvzlL8uk7DU9CMqNtdL4opDmmQJKjeY6Er8SK7G0xNTSqj9?=
 =?us-ascii?Q?LyH3Msz4JABaAqP2NMVNJGl7hdbukmwunWhY5jCgu2HeLa4wj1xydMYITlFH?=
 =?us-ascii?Q?KdawBc8W+OwhMzLO4aisDvHn6XCgVcAqG5x95vxnZaNKi9WUexYM0mXF6ETk?=
 =?us-ascii?Q?QvuoKlnJz2YGywBkI/piJnj4lLVn6xtv1DQAHTR7CD0slIayDlvTR2dKjcFl?=
 =?us-ascii?Q?nkSrFNFjctJX6Rhf5eMZ3tPszqmPqaUM6rD+hqR6NO2rYeCI8HkX6AUPld9N?=
 =?us-ascii?Q?yXJI9wrk3krXVhFKLyFu45vjgYTC8bdAB8wr3t05v88nJ81UoPvDYcYovBE0?=
 =?us-ascii?Q?v1RucLDd6MmVKOuuuF99lIouznvMXCRzYrDyhAoB0ywPLeojdfMCxXkvw/8W?=
 =?us-ascii?Q?T727hQThzsIEuBHDCiyJEF3uiRZt/XGeKk8Lh/6uqwDnecqtQEt4HOSKiTAy?=
 =?us-ascii?Q?gXxws66ixTabSZeOUju0mGIzBVjNUqcMh9aw8lpi6RQX3rCY2BRXzAD7799q?=
 =?us-ascii?Q?9KM3+3pLuk9oLYN5WfufoW9QLa+7zAyeRODKpcnbDX3iK/wopyR2ZKHI45bU?=
 =?us-ascii?Q?fNicg/BX3a3u1M3E6nLgzNSjJNM/srmIMctGcQI786eZGe/WZf+l/RrYUCOI?=
 =?us-ascii?Q?fGVX2+Sks0DcslqgMG6rszBDzkaRuMfitcy3aXQCBbVPYE666JLgZxCSOeP/?=
 =?us-ascii?Q?nKHdnEpbioQOtsTAob8bbaGa5EsrjytanA4S2+WhtD3LOa6C9O52F5ezlNU1?=
 =?us-ascii?Q?GiStnzWL3hP0P/l8UyHSepAfvoLUl0NIVYp+BTzcqUngG8s/ZFELF6LLzlHu?=
 =?us-ascii?Q?pxq3w/8bxbIvc9UpBBXgWZa0ttP+zJE1iLRJehEfe03hNoqkiTeCyxfnt63l?=
 =?us-ascii?Q?M+Yow+SgYaoV5rcBKTz5opzWG4GKFLN8P/nmJv1t4ZJ4NlEwQnqJxyGQm7K8?=
 =?us-ascii?Q?nt+EC9pCkwUTX8BpQXztP8PkK03VDQVVEI5G+hl79DWmnXoruiMI1azmOAv0?=
 =?us-ascii?Q?8Dsz86GgJncvAcVgCBWBWXbw+dpq2mqH+aHdWAL5fiS1KZ87FtHNRZ113j+0?=
 =?us-ascii?Q?Yw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 5YItjT6b8hmU7CRiJRGVmFT51C/6hejQnSdZkyedhjKjiT2zpMBI0JFQ3FSqOdQ3Vdu9yLD76OhCAYUk6tZYOIepci302/qVztqbY75qkskS4mBz8zRqR77j+a4205wwStSy+fim+NagIv8fn4ueOZv/DRgJLS4pBRQsbG5vx9a7ium9SVsuL61fHL4XydMIz6zFq2fOfYFDlRGojDYbQpoNvvsvvbPOHb3KnpMMEBKLZ2LlSrHeo4kgMWZLHZApWmtRdOB66YMIOKQ0P1kX0r/Y23ffwWcYTnd0covbx5+t0TQy7xRL/4WrLzY6F2Ax8ZLX5DCrG5EfRAU4Z0DtnXpz6b5AAClPAs/g5o6aIBW+S+Tx+XDjuESJBMPPsQtF+rXqG1QpM5ayQabJkNLfN1XxJYyi128VroBaKLEfo43V8UtcWybV6BNAxEntnK4Ln4Wiier7JaXVSmaVsoU35tmwSYkSMXRgb8GF3Pn0IkChhxT0060ZTwHwvnv7RaOQG556PHK2+mn0Ek+VNN1JY0Y4M1jyILrXcrIUzYR+9grLctHrrkCcar2zORQtq9oRSvvIYwLISljcclTp85+FI6TJi3Qetpx3d3AfpaumCvPqdwXwnUCJnadOQzcFxXhaZF9FhHzgzdnAXoUzVTQsu80nAiM1cjJq+t+YzQl+MUXE5ZMfoRAyryipLOEKR0E4BICZ3MtaKzgmJkfeqfHwsyfMdbwr33ogw1xmaLwEj+cSSraTKyD7szBMxuUvzQBC4vO+m7mV3lWXlQQBoXeDAgzbstRIZKZ43uSkLexkOEhWJYYrrVM3Z0s/O3S6vzOW6m05HifnG0p5wpoOkPuebYzr2UGxiQgH1eZoYf1NAcldSCGs4URFDHQuh8Afgyp+vJSqiBqZY2qu0JTqcAXEucaOxcVZCpDZbwIZipsmfa4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd673e21-9803-4b42-0fb8-08daffb902a3
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5138.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 16:18:50.7588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ZLOfcPL+GhpkP3cN33whIMDfUpYcFzH4N26RX3+eLcJz44KSRwtizrCbUWuuCO8mDXz/OWLhVB95y2fu1F1LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7490
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-26_07,2023-01-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxscore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301260158
X-Proofpoint-GUID: nZc1fTrco6TVuq9sCclVMzYSPe3gTcWR
X-Proofpoint-ORIG-GUID: nZc1fTrco6TVuq9sCclVMzYSPe3gTcWR
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=darren.kenny@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Alex,

From my perspective, I'm happy with the changes made, so from me at
least:

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

Thanks,

Darren.

On Thursday, 2023-01-26 at 00:25:54 -05, Alexander Bulekov wrote:
> These patches aim to solve two types of DMA-reentrancy issues:
>
> 1.) mmio -> dma -> mmio case
> To solve this, we track whether the device is engaged in io by
> checking/setting a reentrancy-guard within APIs used for MMIO access.
>
> 2.) bh -> dma write -> mmio case
> This case is trickier, since we dont have a generic way to associate a
> bh with the underlying Device/DeviceState. Thus, this version allows a
> device to associate a reentrancy-guard with a bh, when creating it.
> (Instead of calling qemu_bh_new, you call qemu_bh_new_guarded)
>
> I replaced most of the qemu_bh_new invocations with the guarded analog,
> except for the ones where the DeviceState was not trivially accessible
>
> v4-> v5: 
>     - Add corresponding checkpatch checks
>     - Save/restore reentrancy-flag when entering/exiting BHs
>     - Improve documentation
>     - Check object_dynamic_cast return value
>
> v3 -> v4: Instead of changing all of the DMA APIs, instead add an
>     optional reentrancy guard to the BH API.
>
> v2 -> v3: Bite the bullet and modify the DMA APIs, rather than
>     attempting to guess DeviceStates in BHs.
>
> Alexander Bulekov (4):
>   memory: prevent dma-reentracy issues
>   async: Add an optional reentrancy guard to the BH API
>   checkpatch: add qemu_bh_new/aio_bh_new checks
>   hw: replace most qemu_bh_new calls with qemu_bh_new_guarded
>
>  docs/devel/multiple-iothreads.txt |  7 +++++++
>  hw/9pfs/xen-9p-backend.c          |  4 +++-
>  hw/block/dataplane/virtio-blk.c   |  3 ++-
>  hw/block/dataplane/xen-block.c    |  5 +++--
>  hw/block/virtio-blk.c             |  5 +++--
>  hw/char/virtio-serial-bus.c       |  3 ++-
>  hw/display/qxl.c                  |  9 ++++++---
>  hw/display/virtio-gpu.c           |  6 ++++--
>  hw/ide/ahci.c                     |  3 ++-
>  hw/ide/core.c                     |  3 ++-
>  hw/misc/imx_rngc.c                |  6 ++++--
>  hw/misc/macio/mac_dbdma.c         |  2 +-
>  hw/net/virtio-net.c               |  3 ++-
>  hw/nvme/ctrl.c                    |  6 ++++--
>  hw/scsi/mptsas.c                  |  3 ++-
>  hw/scsi/scsi-bus.c                |  3 ++-
>  hw/scsi/vmw_pvscsi.c              |  3 ++-
>  hw/usb/dev-uas.c                  |  3 ++-
>  hw/usb/hcd-dwc2.c                 |  3 ++-
>  hw/usb/hcd-ehci.c                 |  3 ++-
>  hw/usb/hcd-uhci.c                 |  2 +-
>  hw/usb/host-libusb.c              |  6 ++++--
>  hw/usb/redirect.c                 |  6 ++++--
>  hw/usb/xen-usb.c                  |  3 ++-
>  hw/virtio/virtio-balloon.c        |  5 +++--
>  hw/virtio/virtio-crypto.c         |  3 ++-
>  include/block/aio.h               | 18 ++++++++++++++++--
>  include/hw/qdev-core.h            |  7 +++++++
>  include/qemu/main-loop.h          |  7 +++++--
>  scripts/checkpatch.pl             |  8 ++++++++
>  softmmu/memory.c                  | 17 +++++++++++++++++
>  softmmu/trace-events              |  1 +
>  tests/unit/ptimer-test-stubs.c    |  3 ++-
>  util/async.c                      | 18 +++++++++++++++++-
>  util/main-loop.c                  |  5 +++--
>  util/trace-events                 |  1 +
>  36 files changed, 150 insertions(+), 43 deletions(-)
>
> -- 
> 2.39.0

