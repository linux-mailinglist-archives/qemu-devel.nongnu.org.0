Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6DD58FC8B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 14:41:16 +0200 (CEST)
Received: from localhost ([::1]:33870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM7Ux-0002V3-Ly
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 08:41:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1oM7H0-00026v-JM; Thu, 11 Aug 2022 08:26:50 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:29208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1oM7Gw-0002Vl-5G; Thu, 11 Aug 2022 08:26:50 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27BCMrqo025143;
 Thu, 11 Aug 2022 12:26:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2022-7-12;
 bh=ZdXVhQSGRp/vUezjkr6a9HUNBsRXizw2zvjD5p+51h0=;
 b=NJczu8FFFpg0NYRAdn/xPTONAu8kSrXELQyHevw2VilXLTSoUIigk5nKD4wowlry/THF
 ExF8aiFFtyFyaHP6m7K/2FBPxDFdMkXqsNvuL/iGwpfU6Kz1YidfSQdFFKPZMyATgqJj
 u/mGAB1/nIZOPY44RkcZTUVvCOW9lcLZMyTgU4/4Z7BjESAWGHfPrLJ/YGGE5O185cmv
 FrP1XZh81afDNaHZAJJPc/nUeADfK2zOunzoF98gZ7iSHetEvxLUKyvFOVKbFI7o2z6H
 afYfUg+b7wAucIw7dVof4ZxHvMlTIcFDYF7Ua6UxIkl79I8AyIbNdWo0fcrKihYiaofC Og== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3huwqdvjtg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Aug 2022 12:26:26 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 27B9BWN7040716; Thu, 11 Aug 2022 12:26:25 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2045.outbound.protection.outlook.com [104.47.73.45])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3huwqgt90q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Aug 2022 12:26:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EX95NP7G63Hql7hfMVS9mdm5GcyVMHnzcRhugsBXRWJd6u4sKOu8N5PjHmBXrYnHIOkuMSKc64zgS2HfBfVNtiMgCeFtWSIrARdtyapk9VwULd+/YRCsaV/DXE/a1osnM420VrsglMAQYd2tjKyXTBoQZvctIihNwpdEBXNgVAAe1FM3/XI8oTy3DGdhfKqsHLIFm24HPub1XIZdzSZn6UX3vkRUqQNcex0rjojZNji8ToM7Rwq8vay6cfw+IBesFXAmO1V+QmEjl2Dc4fRsV4FfjGkqYyjnYi3nWTir5sRUnjv2DljGIYQxoBzeAspry+jqhJG+J5e5tQcJNKpFDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZdXVhQSGRp/vUezjkr6a9HUNBsRXizw2zvjD5p+51h0=;
 b=QmRsgTwmqrg9eSP9xv0astTQAS32i6JB7c7I0CXQX7W4FaKuROkNmVWd1ABy2F3PF1ihcRPL4Afh88fcGz+6shwrn/dkeGbGhEirNH+wMBEH4BNwCvUEI0Gq+fbROWq18k3v381VBUXN5lZcPPPE4PAowodo9QWFhi+NwVpCmHMSAoUzMv+dXciFqRH8H66eRl2LYlf460urGU54g8iq9yp6JOC4zileBSwlAQzseoBwHUB/TpoGlmkj8Pu0KW4BQ/iNMmCpoDu/aA3EZXUkiDOoKmaS0Vu4AtiNL4HEq5bvNI1OPOHkFCixstHVa7WTEZRFKfB2oxMm2QCLL0Chmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZdXVhQSGRp/vUezjkr6a9HUNBsRXizw2zvjD5p+51h0=;
 b=yDv4r3Y7jSGHdUe3ym7NJLFLywGyIDTMezS4aVscWT9D7+4iC3BpWsY5qIE5YwhwO8AGXVnHGDo2T8a6G+BbHzV/3frCUsKK3OnD2sl9L8StkmNp1n6RS6HF7d88KlJfyTKBl2uED7CAsskgwTl0cM+XH1nRAVvZmXDwqzGc2vk=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB5846.namprd10.prod.outlook.com (2603:10b6:510:14c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Thu, 11 Aug
 2022 12:26:23 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::a9e2:3c71:4b09:789]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::a9e2:3c71:4b09:789%9]) with mapi id 15.20.5525.011; Thu, 11 Aug 2022
 12:26:22 +0000
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
Subject: [PATCH v15 1/6] qmp: add QMP command x-query-virtio
Date: Thu, 11 Aug 2022 08:24:39 -0400
Message-Id: <1660220684-24909-2-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1660220684-24909-1-git-send-email-jonah.palmer@oracle.com>
References: <1660220684-24909-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: DM6PR03CA0077.namprd03.prod.outlook.com
 (2603:10b6:5:333::10) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab66fb49-bfb1-42b4-6ac0-08da7b94b3b7
X-MS-TrafficTypeDiagnostic: PH0PR10MB5846:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iv3otVBLecYAa+CVcDrBblfRkVD//Zn0N91/LUH1zqx1kT0yE+arFoN/kQDDTsWlTRBdvv6CuHS0kMsLfF6WYUkaXNZjjygtZC7n5NJTAH3v60MRVZiQzBv7bQXLv6qNcWC9m6JZvTRlK/9aUGOeimljzG5nNxcMrruIu1m45OKItbki9thp45DQ7Jo+FsxRf/d0EuSjWQGDKNkZLhDsNEBpj+LA8iw8+Id+lw+FH2Df+L/5/YuSONmm4TI13aTFnXu0svrC4Rc4zQJoCfcddtbUBCVtGJXM1H16S3GtVU0GMGEqWnESO5woemA5oKiWsG6pvDQsrTUPfTI3tJLDEgqog5+ADU+Ixe3ohh/zAtD7rIyALIhpEtA47jH+kTme2GCkv3YRnbwtpbBO0UoU6ITJgb2Abdy+dnypIP3ks3yV19iHafsH4PjDZwcPuVjndp4dsCvV9/lhlEurKcJdw/+aHnrmq+dCTyo3Lj4ilKzafWHU0NARZYIqKbp2wUe2ca/iU9B62lxq7hDeMPyDlCdQpqoCAjG4+VruX2FeqEhnUvoM6p0dKS0qg+O3M3z/mkkmcZwBfwoSySPgdV3h5ktMaqFXF/PztCbG4jNqJ5X0AXUZzkfBfGaDJI9FmtVzyCMyQ6hHf2r7sfMLN3cgvV30GC1VdoyHxWGyhn79c/yTZUPD2+MfYp1YU+1XlTGGkpPCpVqJEy9D5Ox+eLDWpQRm8nV/9Mf7CU5eZuNXiLuAKMHMdLmN3ILfuZj0xtSfAtJL5Fj3SA9qvlQ05+n/4Ev6kZu2927lLyCPHvGaEC8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(136003)(346002)(39860400002)(396003)(376002)(38100700002)(316002)(38350700002)(6916009)(66476007)(66556008)(4326008)(8676002)(8936002)(5660300002)(86362001)(66946007)(44832011)(6506007)(6666004)(6512007)(52116002)(26005)(41300700001)(83380400001)(186003)(2616005)(7416002)(478600001)(6486002)(36756003)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?42NgA4oZdm+JSdpsoDJZPSxKSC7LdrYPVKqdxG/jYPTLAwjeelkiEYiLUuqL?=
 =?us-ascii?Q?61nvmVQ4v6X2BZuyGGgd76yfqHKRK6IudlJFi2wiO2gDYjOQY0WnDNQOGaIf?=
 =?us-ascii?Q?CdgEJo3Z22qygObW8G9Zy9J42g+8Ph3oZfja1y2AT6cdGwbfFjwd8vv+hITG?=
 =?us-ascii?Q?P0byRy8BufW74TlLv88w5vuhyPgk83cML6536Utj5eGZH8FqJlP8/hNHGb+C?=
 =?us-ascii?Q?L5loGxbXF+LSFlOhiWGTJD6XB4G4A/DzGEr+/xuMkyyUSufsm/bbA+NlEFRA?=
 =?us-ascii?Q?sYKFyeedPOCt5zaH64Q6UlcUnd5e2F8jvpu6bK+WsoBAbHCay+Y+hxhF3Y0Y?=
 =?us-ascii?Q?tgmLPgvgzVaTjyLYuIoCFAAZTvL4cBClz3bqS6b1FgHoaZyna3OppxgRBZ5y?=
 =?us-ascii?Q?mdVTKvv9T8zsqbuVDzKBMzERsNA2+2mqa7Sthpy17EsVGy+coN1ej3fd7b3G?=
 =?us-ascii?Q?xwS81hyKu6qeu2mt1Kndec9esZOsoBGYa3XWMs2ZchlXNY4uzXbo7LmZmX1b?=
 =?us-ascii?Q?EblH+pL9NS2GHzm4aWYpLqUD5MIxV2MtLE+PAdtj7rIh9R3ZdAgvnnZRVz7c?=
 =?us-ascii?Q?IVsXi2NOC50h6nfqFM5v7mBcILN6Qwyj9LT3a09Zyk6zDMCa9seF3bu7/+Ri?=
 =?us-ascii?Q?I+SPo8ftozOMhjErgcA0WtvGGlEiT8Cf4m1MhdDhFGoEIni7VX7IBdR0qqfd?=
 =?us-ascii?Q?mC9Bkh+ID6sjbjcutX4THQ39JnKMqqaO0MWXFPiZs0Hg0sYVnWywydX6okP+?=
 =?us-ascii?Q?RgwWHRNdEOIpVPOF3AOLKv7Yiyf9F5dj0gX7ujG4F315UmWsClDfqQeFizTV?=
 =?us-ascii?Q?0EfH4j2r51eoj52YRVxrJwZYIAnCCgfNPBB5EQlzh8JNij/pvDYqPeT5PVi0?=
 =?us-ascii?Q?/CZDQTJYuoGj83d0Oh9bWzbap3kmFsz/n9pi9JKJhrMlXHU/0JhpTeJfEq+8?=
 =?us-ascii?Q?Twp5wYwnwvfTts55lxvscBPvZFFHXQpxjVk7Cax6PCBCgHilrwFCvwvMZP5K?=
 =?us-ascii?Q?brzuQGZ4PeZ67H9cYlYiDYNEOP8UDwXu54gpm5dqW6vaU2lAYWf7CYutebqW?=
 =?us-ascii?Q?KArHT087G97AsAsxogJavwmF6Yo/hmOscP5wgRxwAA/ZYbBv3563NF93c40B?=
 =?us-ascii?Q?A9oMGaVNdmSYLfOg8AK4OStCb5smc3psWZ/70FtUGGGZPUg1s81huO8erU+A?=
 =?us-ascii?Q?n51YBn+35JmzqPtkMJP1wi+OLgtjM+krHbwdq3B8Xfd/02LQYeNlFL7cPMuq?=
 =?us-ascii?Q?CvRs+RJ+smPYDDRVUKUJNHU1NsuqirJ3gnFN7J2StJfkKj/ukkh7PzXrrRke?=
 =?us-ascii?Q?QhCgDpCdeTLHJpmlYHDOnDtW4JrZlqPMAet1vqUs5if6/Vjbo3LDna3LAMeW?=
 =?us-ascii?Q?aXqISZT9PVLypPBlvckAQ18G32UNQWpJIugo28pelg/pS2T1IF3AcRwpzl6s?=
 =?us-ascii?Q?3E219ROd9wvb7xnbd4R6+swJROvOiJrVhUWByFJywnqo0gOVp+Sne8r9V8Mm?=
 =?us-ascii?Q?iZ7/M2hPe+9WEqvF+kFJnodhxugvd50hPUuz232JIuWX6imEYZFw2zHsEJsG?=
 =?us-ascii?Q?phxUhJo7gEnP1TmNJOlyjcS4qBAkcLmvei8l1GUx?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?0q5n7vE1pzkALTBfWssZ8THoSlK2jYLlBKNwXSnhh7qpdN8k5+dj21+pZgi7?=
 =?us-ascii?Q?kIb7LN3W+xcFBWaX4gjYjw4UB+pWbEuvLXLXW7Fi7o/Ar2EJbI0ckARzoO6n?=
 =?us-ascii?Q?9Z542TdNICMW0d2621ECW7vth47wXBDE7V9RqMhCSbaI2J3wtqJ3aYDedyuM?=
 =?us-ascii?Q?tvU1NK0TP7eXRsikO3u4BJBKYCcici+/2ugU8bYdLmaSY2ge9XeizSDDhDi8?=
 =?us-ascii?Q?ZglKlG+BLgQ1LiKjmsvy7ZSB0vBaimwEwTcVnKCjLx1K9UzC5GbLRFosjAtP?=
 =?us-ascii?Q?1B5CSrw8BESWlbrbVhBwJReZzQ8DNJTeH/bnmTmdSaVZLiExdhIHl3+Moq9H?=
 =?us-ascii?Q?eKfPoAjQ7AHKOaRbVaEkm/UM24L9M7SBZrIRgHrgm5kCMuJTRhJ+ohy7UGnU?=
 =?us-ascii?Q?eww9lRqWbvHJ90TU1Ste/xETfvmHOcKpznbx6KZKpj7zrB9drVD1LpcAVqac?=
 =?us-ascii?Q?EtKStEXi5yymmm+uQyf9ePy5guacZcTF/aLWt4UIqRDAXb8A4cJQiIvOB1kz?=
 =?us-ascii?Q?GKKWvl8dH9utvirH35P2t9rkFp07LxSCNGV4PuuIDXYVE/3I2/ilDAadVmUy?=
 =?us-ascii?Q?OeYO8d8ANdCsOilvndELNG20kfvU3la+P9p+aHaVuPhd029P+/702ICpF2w1?=
 =?us-ascii?Q?FW14aN6U8KwMaNja2Ts4BtUEeprRNi9gdRgzJkCNIY3WleabQ3lEBT3aq7SK?=
 =?us-ascii?Q?QBJHmJDYBsUYGc5wrUBHTQ6Rt5dn1lounyqHmJbIOPz7TC4w5eY+2eUrBLz5?=
 =?us-ascii?Q?kC3oavcYsXV70UrhQG0NXzsBdZJhBMteQkVCOEGaNEiRd3cJov67BwxIsRcq?=
 =?us-ascii?Q?0BNoMNWcEeG+lN8NPpkqI9DR6deIDbPGkJNN60QK4AM7cOxrcX2/ZNpARBAQ?=
 =?us-ascii?Q?F260MBZYvhBPio77rjflC5kiIRjtlrGFJXqJ7E+1eGIp84rxAb673tZcQFxx?=
 =?us-ascii?Q?376fOP/DMGUZh/nhj4IOKJHnn9BHkMpdoB8mI6ZLczWYLvYr9F7ynVmPMmYU?=
 =?us-ascii?Q?H2mna+ipC/kbkdT54679QP9yPrx9muKivQMSfIFU6KTJnyv2nVP7ACYUJK/K?=
 =?us-ascii?Q?BiWwIVKPGqTags2M01fRuocgqVM9kUMnzPct4H5eJ5HPCUmY+n7FVAWS7lSU?=
 =?us-ascii?Q?fkuSbD8tMuYUbjr88OHiXysG52t8FMi8vhyJa6h+p/s+7IcU18/9HSF5fjmw?=
 =?us-ascii?Q?E0zdp6xK4lAzB3nQ9o0gG0tqIlZyDi8qhOYXwkVKSleon7Ni+cg4hdn/11xz?=
 =?us-ascii?Q?ZKZcqzdwGG3WrgXWqnoCEvtUcZzLDMY4R5Lktttwv6RS/yMR7cYtE1qkGyJy?=
 =?us-ascii?Q?hTt8vB1av4+1QZJw1JKmAiYky2CSHW5f4NcqpyROoms+xIJtUxHIvwTZLb31?=
 =?us-ascii?Q?JJamAOoNK4UazmajQlOLL27vbTh430DtKirOk6T8gnCIgwb6jdPMs+OHpPaB?=
 =?us-ascii?Q?JCrx+83MuITq/LJj21o4E6zIytFTjSLxl1/G3gzat6lflUs7wGD0VF8AetdJ?=
 =?us-ascii?Q?cFuVzm1CI1o/cd6J7+px33l/ZKfYSks/wPnO60h5rRTq9SAmEEw5vpUBG8i4?=
 =?us-ascii?Q?SnBCedZNe+4tpA2LcIK/N98PPYPy9TYdCKixtfzJG1jbPoDhXmSsnnP2Z7sp?=
 =?us-ascii?Q?cplXv+unSnwhJUWYrVh6/ltSZShXOY3TLDC/qzkkRf5Q1RbDStgK5KDikB6R?=
 =?us-ascii?Q?hj8od2jCDuEPB9g+vwZFl6LjSh/qv6RZSeKnZYQmJlsRx0Fz6BUbXd97kP48?=
 =?us-ascii?Q?R7nINlhHn4yX/50Y7eUE0SY2oXdZnrRUq8P1kg72TvzlDom5wcH+VNanRWkx?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: QMfKjr4WwiqdxQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab66fb49-bfb1-42b4-6ac0-08da7b94b3b7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 12:26:22.8583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A7gJmTe9kcAwUVc+/3y0M0IxjtdTgy4qbEd0tP65qO7cHZc9IbrelV3pOaOBSZTCFTjPVIVZThLPCPmYAMNd5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5846
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_10,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208110038
X-Proofpoint-GUID: 0pjNwnwyYuvLVMkdSOTa7zLjGUvVAO55
X-Proofpoint-ORIG-GUID: 0pjNwnwyYuvLVMkdSOTa7zLjGUvVAO55
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0a-00069f02.pphosted.com
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

From: Laurent Vivier <lvivier@redhat.com>

This new command lists all the instances of VirtIODevices with
their canonical QOM path and name.

[Jonah: @virtio_list duplicates information that already exists in
 the QOM composition tree. However, extracting necessary information
 from this tree seems to be a bit convoluted.

 Instead, we still create our own list of realized virtio devices
 but use @qmp_qom_get with the device's canonical QOM path to confirm
 that the device exists and is realized. If the device exists but
 is actually not realized, then we remove it from our list (for
 synchronicity to the QOM composition tree).

 Also, the QMP command @x-query-virtio is redundant as @qom-list
 and @qom-get are sufficient to search '/machine/' for realized
 virtio devices. However, @x-query-virtio is much more convenient
 in listing realized virtio devices.]

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/virtio/meson.build      |  2 ++
 hw/virtio/virtio-stub.c    | 14 ++++++++
 hw/virtio/virtio.c         | 44 ++++++++++++++++++++++++
 include/hw/virtio/virtio.h |  1 +
 qapi/meson.build           |  1 +
 qapi/qapi-schema.json      |  1 +
 qapi/virtio.json           | 68 ++++++++++++++++++++++++++++++++++++++
 tests/qtest/qmp-cmd-test.c |  1 +
 8 files changed, 132 insertions(+)
 create mode 100644 hw/virtio/virtio-stub.c
 create mode 100644 qapi/virtio.json

diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index 7e8877fd64..e16f1b22d4 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -60,4 +60,6 @@ virtio_ss.add_all(when: 'CONFIG_VIRTIO_PCI', if_true: virtio_pci_ss)
 specific_ss.add_all(when: 'CONFIG_VIRTIO', if_true: virtio_ss)
 softmmu_ss.add_all(when: 'CONFIG_VIRTIO', if_true: softmmu_virtio_ss)
 softmmu_ss.add(when: 'CONFIG_VIRTIO', if_false: files('vhost-stub.c'))
+softmmu_ss.add(when: 'CONFIG_VIRTIO', if_false: files('virtio-stub.c'))
 softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vhost-stub.c'))
+softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('virtio-stub.c'))
diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
new file mode 100644
index 0000000000..05a81edc92
--- /dev/null
+++ b/hw/virtio/virtio-stub.c
@@ -0,0 +1,14 @@
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qapi/qapi-commands-virtio.h"
+
+static void *qmp_virtio_unsupported(Error **errp)
+{
+    error_setg(errp, "Virtio is disabled");
+    return NULL;
+}
+
+VirtioInfoList *qmp_x_query_virtio(Error **errp)
+{
+    return qmp_virtio_unsupported(errp);
+}
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 5d607aeaa0..bdfa82e9c0 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -13,12 +13,18 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qapi/qmp/qdict.h"
+#include "qapi/qapi-commands-virtio.h"
+#include "qapi/qapi-commands-qom.h"
+#include "qapi/qapi-visit-virtio.h"
+#include "qapi/qmp/qjson.h"
 #include "cpu.h"
 #include "trace.h"
 #include "qemu/error-report.h"
 #include "qemu/log.h"
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
+#include "qom/object_interfaces.h"
 #include "hw/virtio/virtio.h"
 #include "migration/qemu-file-types.h"
 #include "qemu/atomic.h"
@@ -29,6 +35,9 @@
 #include "sysemu/runstate.h"
 #include "standard-headers/linux/virtio_ids.h"
 
+/* QAPI list of realized VirtIODevices */
+static QTAILQ_HEAD(, VirtIODevice) virtio_list;
+
 /*
  * The alignment to use between consumer and producer parts of vring.
  * x86 pagesize again. This is the default, used by transports like PCI
@@ -3698,6 +3707,7 @@ static void virtio_device_realize(DeviceState *dev, Error **errp)
     vdev->listener.commit = virtio_memory_listener_commit;
     vdev->listener.name = "virtio";
     memory_listener_register(&vdev->listener, vdev->dma_as);
+    QTAILQ_INSERT_TAIL(&virtio_list, vdev, next);
 }
 
 static void virtio_device_unrealize(DeviceState *dev)
@@ -3712,6 +3722,7 @@ static void virtio_device_unrealize(DeviceState *dev)
         vdc->unrealize(dev);
     }
 
+    QTAILQ_REMOVE(&virtio_list, vdev, next);
     g_free(vdev->bus_name);
     vdev->bus_name = NULL;
 }
@@ -3885,6 +3896,8 @@ static void virtio_device_class_init(ObjectClass *klass, void *data)
     vdc->stop_ioeventfd = virtio_device_stop_ioeventfd_impl;
 
     vdc->legacy_features |= VIRTIO_LEGACY_FEATURES;
+
+    QTAILQ_INIT(&virtio_list);
 }
 
 bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev)
@@ -3895,6 +3908,37 @@ bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev)
     return virtio_bus_ioeventfd_enabled(vbus);
 }
 
+VirtioInfoList *qmp_x_query_virtio(Error **errp)
+{
+    VirtioInfoList *list = NULL;
+    VirtioInfoList *node;
+    VirtIODevice *vdev;
+
+    QTAILQ_FOREACH(vdev, &virtio_list, next) {
+        DeviceState *dev = DEVICE(vdev);
+        Error *err = NULL;
+        QObject *obj = qmp_qom_get(dev->canonical_path, "realized", &err);
+
+        if (err == NULL) {
+            GString *is_realized = qobject_to_json_pretty(obj, true);
+            /* virtio device is NOT realized, remove it from list */
+            if (!strncmp(is_realized->str, "false", 4)) {
+                QTAILQ_REMOVE(&virtio_list, vdev, next);
+            } else {
+                node = g_new0(VirtioInfoList, 1);
+                node->value = g_new(VirtioInfo, 1);
+                node->value->path = g_strdup(dev->canonical_path);
+                node->value->name = g_strdup(vdev->name);
+                QAPI_LIST_PREPEND(list, node->value);
+            }
+           g_string_free(is_realized, true);
+        }
+        qobject_unref(obj);
+    }
+
+    return list;
+}
+
 static const TypeInfo virtio_device_info = {
     .name = TYPE_VIRTIO_DEVICE,
     .parent = TYPE_DEVICE,
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index db1c0ddf6b..375eb5671b 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -110,6 +110,7 @@ struct VirtIODevice
     bool use_guest_notifier_mask;
     AddressSpace *dma_as;
     QLIST_HEAD(, VirtQueue) *vector_queues;
+    QTAILQ_ENTRY(VirtIODevice) next;
 };
 
 struct VirtioDeviceClass {
diff --git a/qapi/meson.build b/qapi/meson.build
index fd5c93d643..c35ba874d2 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -49,6 +49,7 @@ qapi_all_modules = [
   'stats',
   'trace',
   'transaction',
+  'virtio',
   'yank',
 ]
 if have_system
diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
index 92d7ecc52c..f000b90744 100644
--- a/qapi/qapi-schema.json
+++ b/qapi/qapi-schema.json
@@ -94,3 +94,4 @@
 { 'include': 'acpi.json' }
 { 'include': 'pci.json' }
 { 'include': 'stats.json' }
+{ 'include': 'virtio.json' }
diff --git a/qapi/virtio.json b/qapi/virtio.json
new file mode 100644
index 0000000000..03896e423f
--- /dev/null
+++ b/qapi/virtio.json
@@ -0,0 +1,68 @@
+# -*- Mode: Python -*-
+# vim: filetype=python
+#
+
+##
+# = Virtio devices
+##
+
+##
+# @VirtioInfo:
+#
+# Basic information about a given VirtIODevice
+#
+# @path: The VirtIODevice's canonical QOM path
+#
+# @name: Name of the VirtIODevice
+#
+# Since: 7.1
+#
+##
+{ 'struct': 'VirtioInfo',
+  'data': { 'path': 'str',
+            'name': 'str' } }
+
+##
+# @x-query-virtio:
+#
+# Returns a list of all realized VirtIODevices
+#
+# Features:
+# @unstable: This command is meant for debugging.
+#
+# Returns: List of gathered VirtIODevices
+#
+# Since: 7.1
+#
+# Example:
+#
+# -> { "execute": "x-query-virtio" }
+# <- { "return": [
+#          {
+#              "name": "virtio-input",
+#              "path": "/machine/peripheral-anon/device[4]/virtio-backend"
+#          },
+#          {
+#              "name": "virtio-crypto",
+#              "path": "/machine/peripheral/crypto0/virtio-backend"
+#          },
+#          {
+#              "name": "virtio-scsi",
+#              "path": "/machine/peripheral-anon/device[2]/virtio-backend"
+#          },
+#          {
+#              "name": "virtio-net",
+#              "path": "/machine/peripheral-anon/device[1]/virtio-backend"
+#          },
+#          {
+#              "name": "virtio-serial",
+#              "path": "/machine/peripheral-anon/device[0]/virtio-backend"
+#          }
+#      ]
+#    }
+#
+##
+
+{ 'command': 'x-query-virtio',
+  'returns': [ 'VirtioInfo' ],
+  'features': [ 'unstable' ] }
diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
index af00712458..897e4e937b 100644
--- a/tests/qtest/qmp-cmd-test.c
+++ b/tests/qtest/qmp-cmd-test.c
@@ -103,6 +103,7 @@ static bool query_is_ignored(const char *cmd)
         "query-gic-capabilities", /* arm */
         /* Success depends on target-specific build configuration: */
         "query-pci",              /* CONFIG_PCI */
+        "x-query-virtio",         /* CONFIG_VIRTIO */
         /* Success depends on launching SEV guest */
         "query-sev-launch-measure",
         /* Success depends on Host or Hypervisor SEV support */
-- 
2.31.1


