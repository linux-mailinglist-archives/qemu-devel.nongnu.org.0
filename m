Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E8A4B0AA6
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 11:32:35 +0100 (CET)
Received: from localhost ([::1]:51520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI6ka-0008Bm-QL
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 05:32:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1nI6be-0000XQ-5D; Thu, 10 Feb 2022 05:23:19 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:62240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1nI6ba-0000t4-Vj; Thu, 10 Feb 2022 05:23:17 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21A7n4do020151; 
 Thu, 10 Feb 2022 10:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2021-07-09; bh=mtNKUtZK7n2QFYHTthdF1XDE/cv5oLN6zY3IY9/lwF4=;
 b=VuqL6mKlr/zPfwgZMGhDUkAvyBfQyHrrnI7Q31hSecyygXIKMqsXo+keBvERNonSK3hn
 SHtQnad5EmXPHIgWGvdfutnfUsPvzVcK6vH+fQEYdYJSTxCSS/ZRB8nu3ptLGtjZ3DBR
 GdKQPrC2CDbvVw2WLzDuA/ZE+apkAc3V9glOiStYQkYMExqT9BXRpDlV3p/vNDXbvdwF
 z7rb36z+XoI9YRplCTIpiGcAqwnyDwNhBFxPqQ6NuibXwGD1QW8ca3NrM+41/VhT9mNM
 UgIGMbT4wouWglIMBUrT02ovYLJSDER47urvSm/qyz21udAji280wIhq5WVo9M3K8YEf qw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e366x0vjh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Feb 2022 10:22:49 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21AABeDS191918;
 Thu, 10 Feb 2022 10:22:48 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
 by aserp3020.oracle.com with ESMTP id 3e1h29x6ca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Feb 2022 10:22:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UQs6ueRnDWH0kfHVzVP3Uq6y09yYZItR2umqIyWrPwO8UondUpPqRHC571YJ/n07CbT3sxjy2z5CkRSQK56VIy84Ja0KoWDgWsftXCSactfNuw3rmt+uw1MNfaMQMyx2mPCtbLgbNP1AiQHff+OvI24Y3SLFacZDIzGUwMIS+lzOYTXan6aNn4OTv8Y4hakxJ0kDKIo3bcfTCifM6uI18tMRLfOnRxJ0OHXpVAISyvA3CMAh8V9truacv9a43Ot23oWseyUg1uqWDen7Ws4Qgz7+0OnUdFNkKzHd7NAcxKdECqtxFRIckrYqLSkDJ05I0AQ1VXpKDhJKHHFdw/3VAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mtNKUtZK7n2QFYHTthdF1XDE/cv5oLN6zY3IY9/lwF4=;
 b=cNk6AMb+rJzzAU2G2rzDb9jVrUXb27RcPDikKqT8aDBbFpWO3nlWBSQsyy4YjILMdwFw5Ho2ygixD495IBmBoUhXPP45cxejN0z5lJayS+9/kivCXHvk97Ds3uN54VsGPpMVbgYH/eso65qhc36xz1QDOSxkQ1cZZwQ/7EOz7H6v88TXxiCSgRZ3mj+t3HwXwRxSNvSi2Cx3FtyT7YDSRO92B8c6CAplYkEybIzIOlaquF+1/0jUhEMb1YRJ3E57ZFClYvZuBXFNkP0Rq8MShdqTz63i12/+o+AFJkJFZLUFSlKHcpGU1HRoFu8+LyWbJ7ZK7QceaCIV/EOWHIo/Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mtNKUtZK7n2QFYHTthdF1XDE/cv5oLN6zY3IY9/lwF4=;
 b=WNQCC1C0+zlko9uwdrwLaXPF8P3lTQqg5WEbuOXqM1AAUtfN+ppWAQEE9wgi1NQWFxDqzggTygFP3AN2xH+8prXwIrAWafia9P555sEsVztEk1SoozTQWsSE6LD2/mAL2Mc/ovH9Hm73ucgMSdp77I+FQNJYq2mCjdzlqA8yvDw=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by SA2PR10MB4809.namprd10.prod.outlook.com (2603:10b6:806:113::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Thu, 10 Feb
 2022 10:22:46 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::b8e3:f092:c0ea:9ddf]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::b8e3:f092:c0ea:9ddf%4]) with mapi id 15.20.4951.019; Thu, 10 Feb 2022
 10:22:46 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v12 0/8] hmp,qmp: Add commands to introspect virtio devices
Date: Thu, 10 Feb 2022 05:21:52 -0500
Message-Id: <1644488520-21604-1-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::34) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8b78001-65f6-4fb9-ec2f-08d9ec7f47d3
X-MS-TrafficTypeDiagnostic: SA2PR10MB4809:EE_
X-Microsoft-Antispam-PRVS: <SA2PR10MB48093215A6ADC06CA5BD9FF3E82F9@SA2PR10MB4809.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q6Hq2WzUupecH10oKITt/eqJQwKyDRzife/3Q3oljCq6WZlEKqv1DG/vMCn89Do641WlcVUP8Xq/HOv8Pd6oL7MowT4hvsyxWPa8vBc0GVvfxjBBcC8WKnvr4r8ayy1UE9dIs7otoQxXmr7WgRjmPYML1tvTpkQvLTfKkDZXjTjpHrDTgX1THcIdGzd6I1m2cAu5KCPOmUulbYlrLhfgL3hBujQqa0LWKpZSviodkr+DXz/ie4ic/15OjoGsjuSb+tXTobScDCvRPmKKjDBWfEWEz/Uvnflvvs3qpH5UoKTtKX03/REHcm/2eNRyPkhqhXER/HRJykgdYYa9R6IdLFAOtP8jhJlJMAtBczPMY5whcpYaVm4gMIKaFfStQlbpRy3qt0HoqGI0CH/yP0t24r/f+c/fCZDs3DDR08owaB5SqLeuUe8TMj6JHhFjAiAQDJDE9MiLh5AxpXJ1iFGpKQV9gSBuxptf6/QqVx8za2lkKiyzlM9MGWA8ADJDO+KXyetf2aBKjBxrdxyjO5yiGg3OPu/0wKTnrFTWwzhNWf2uUF9zCBlHP2I6+VKSQyPknI0UtWcjPzZ/DUtsIiHvy5SyIlCXDOIow/mP3rzWzjBzATBns2F+llxxqSvQXDD/l//RCOxIAudhQupHo0QM+QFb1wSMqPgdDoodFZv55rqs4YY6YCYZs+yn3ajca32ShVGvElnJ1X3+r8arE1/aGg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6916009)(8936002)(26005)(66556008)(4326008)(66476007)(186003)(8676002)(66946007)(316002)(86362001)(38100700002)(38350700002)(6506007)(52116002)(2616005)(6512007)(6666004)(6486002)(508600001)(83380400001)(44832011)(2906002)(5660300002)(7416002)(36756003)(30864003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9ksf15UUpQF2bqN4IkDLFGEI8BvlYhO2NGDCFP5ikxY6cyJRwfKxKUURNzyN?=
 =?us-ascii?Q?jtNFoTPr/16TDcgIKFfuvccnk+lyZc7jHxkN+NgFx/sl/o2wDAldY1Lz2Dje?=
 =?us-ascii?Q?GPSA0gwuIgBY+tOdxq+Mb29HYzi4mWrYOcg8L5yh24fd4y16/hmWMMJBtuQB?=
 =?us-ascii?Q?JkH+/6EyHKXZio4EewvuGgAq5qVIfALRzkEWlaaBj0tEKbJgX8DDg9wlHtg3?=
 =?us-ascii?Q?43RsUj9zhgSd9jWJueHUXUghdzUvODrMXYtezmC8iIc/ZaeSifJy3DCLl0oS?=
 =?us-ascii?Q?pZokwPJx8uQwoD+Rjh7lVsHqKiHmneI4bqy/unS7hUnP+4wOacLQW4pJpxzy?=
 =?us-ascii?Q?5AkmPRGOfBcp/ljlZ8cGFuA524kRo24796554WLX6rpVBV4hPRq71zvuJMvS?=
 =?us-ascii?Q?pzKDin/flEBOs7jF0Uj6e4sOJLgi10dntmtd1XI8zvME04V+emOPrhMG9E80?=
 =?us-ascii?Q?IStZbL8RylTeJR0PKqa3BvRDawlhdt7YIeTIKCc+NOV25cIOI9UdY2lYOKfj?=
 =?us-ascii?Q?JId2hlKi8Sbw9OdmaLiN6+dHdmeIBmwPZFY91GoAt8dx4s/ykj5Bd+3jcvEV?=
 =?us-ascii?Q?medXzkML+FyMCGHzCAB4IJTD0gHdWOb50qpNUrU0a0cMygLQCzmzQZ79KC6y?=
 =?us-ascii?Q?5DF1v22L//xb33BkuLJykpjqro4N8NIFBF+Et/t5s9UpWKOJkSHUZp8vL446?=
 =?us-ascii?Q?DwqiuRkY3RkSitsmEfCaXzt2CAI+d0VRAzA9IxwsqViBosp3BpOULTZvibrH?=
 =?us-ascii?Q?FDpzPjDRF2NJTqi7ohSPAIDlmrkAlwVyopbQEbGC5CFh7Jh1EHRt9G3SKqhI?=
 =?us-ascii?Q?e+ARzRDBNZK1mmCJRH5+ptR3sku7yw2+rz89xWM+czrtVm29fzDSmD6k98Bb?=
 =?us-ascii?Q?l1ciYjmaxw07J0KzX1ee7qVnVtFWxmyWWmnJJbNfDWbkIvaDr7l4MD9Lvhpa?=
 =?us-ascii?Q?YLqYjbV49Avvj8Jn9B+qZKxi3EyqxBMbF3aHkcwJG3+SeSaWukc/Je5o7sEY?=
 =?us-ascii?Q?0drzbyjecE55pAN54SHCThbc7O/j/VCjU7RNIHvA5/FJd0oh45iH+iZsS87/?=
 =?us-ascii?Q?U401+HQSm7g+KJuOm/rYIJQrjrbS++swvrzdPsERGlhzRK1QIhHHrcE80+/v?=
 =?us-ascii?Q?gkFbSwb+nx7p47MdnssbU314FEYHBxtSoo5px9JJq0ctRDhfZpg9KIpn+CLz?=
 =?us-ascii?Q?vbPivxiFTOkVazoQWFYznDcyUpFdiY2NZLzl9vUKp4hXpelvqbmzhL//9t+L?=
 =?us-ascii?Q?vy/cUFjdgqH5ymTZX3W2KnwoJjMGx0qyTlYj092EiS0sELjfwKjqRgApIkeE?=
 =?us-ascii?Q?0HY+rUQPJ3t1lgC64iJXHfAb70LHNVhwTPRrcfYcqEeb+6IOB64aI5xoKgpm?=
 =?us-ascii?Q?M9423XWxYjJPAv2W56DR/1XbGRg0yWRwCdirC9Wmtf0k0XssDiNd2KgL5jxc?=
 =?us-ascii?Q?kMQKBioLewx9Ebz3r07vNA0DBqksrsoxTld7cvKuihnnqkTs2RarDF7Hcygw?=
 =?us-ascii?Q?7tP8NcH2zgOY7EN82KNoG/21QI4OjiypH/NBlwtvumX7ApziHHnTnrg/yK7n?=
 =?us-ascii?Q?XWKoWmC3tyYwMwYT9Ch0/rH8G0ZaoNTcFO31W0pjTLNW8LdSdZlsrAkoYG2I?=
 =?us-ascii?Q?PIsLT2CoySpO9xNwtoChbgg=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8b78001-65f6-4fb9-ec2f-08d9ec7f47d3
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 10:22:46.1282 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: McYl/Vu4iaImxTOWIfzVrTXgDJ4lXAgxuHPCy6ddccxtwJsQqdZqPuL0DpR4EnL6zYoiS8kGu235eBzdh27wwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4809
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10253
 signatures=673431
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 bulkscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202100056
X-Proofpoint-GUID: 8D22u41mydVEGLaMXLqAqkFqjbzxrM8-
X-Proofpoint-ORIG-GUID: 8D22u41mydVEGLaMXLqAqkFqjbzxrM8-
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: mst@redhat.com, qemu_oss@crudebyte.com, kraxel@redhat.com,
 si-wei.liu@oracle.com, joao.m.martins@oracle.com, eblake@redhat.com,
 qemu-block@nongnu.org, david@redhat.com, armbru@redhat.com,
 arei.gonglei@huawei.com, marcandre.lureau@redhat.com, lvivier@redhat.com,
 thuth@redhat.com, michael.roth@amd.com, groug@kaod.org, dgilbert@redhat.com,
 eric.auger@redhat.com, stefanha@redhat.com, boris.ostrovsky@oracle.com,
 kwolf@redhat.com, mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series introduces new QMP/HMP commands to dump the status of a
virtio device at different levels.

[Jonah: Rebasing from previous patchset from Jan. 20 (v11). Original patches
 are by Laurent Vivier from May 2020.

 Rebase from v11 to v12 is just fixing some virtio hmp commands to use PRI
 when printing out long int types (for 32-bit compatibility).]

1. List available virtio devices in the machine

HMP Form:

    info virtio

    Example:

        (qemu) info virtio
        /machine/peripheral/vsock0/virtio-backend [vhost-vsock]
        /machine/peripheral/crypto0/virtio-backend [virtio-crypto]
        /machine/peripheral-anon/device[2]/virtio-backend [virtio-scsi]
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
                   "path": "/machine/peripheral/vsock0/virtio-backend",
                   "name": "vhost-vsock"
               },
               {
                   "path": "/machine/peripheral/crypto0/virtio-backend",
                   "name": "virtio-crypto"
               },
               {
                   "path": "/machine/peripheral-anon/device[2]/virtio-backend",
                   "name": "virtio-scsi"
               },
               {
                   "path": "/machine/peripheral-anon/device[1]/virtio-backend",
                   "name": "virtio-net"
               },
               {
                   "path": "/machine/peripheral-anon/device[0]/virtio-backend",
                   "name": "virtio-serial"
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
            status: ACKNOWLEDGE, DRIVER, FEATURES_OK, DRIVER_OK
            Guest features:   EVENT_IDX, INDIRECT_DESC, VERSION_1
            Host features:    PROTOCOL_FEATURES, EVENT_IDX, INDIRECT_DESC, VERSION_1, ANY_LAYOUT,
                              NOTIFY_ON_EMPTY
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
                Features:          EVENT_IDX, INDIRECT_DESC, VERSION_1, ANY_LAYOUT, NOTIFY_ON_EMPTY
                                   LOG_ALL
                Acked features:    EVENT_IDX, INDIRECT_DESC, VERSION_1
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
                         "transports": [],
                         "dev-features": []
                      },
                      "nvqs": 2,
                      "protocol-features": {
                         "protocols": []
                      },
                      "vq-index": 0,
                      "log-enabled": false,
                      "acked-features": {
                         "transports": ["EVENT_IDX", "INDIRECT_DESC", "VERSION_1"],
                         "dev-features": []
                      },
                      "features": {
                         "transports": ["EVENT_IDX", "INDIRECT_DESC", "VERSION_1", "ANY_LAYOUT",
                                        "NOTIFY_ON_EMPTY"],
                         "dev-features": ["LOG_ALL"]
                      }
                   },
                   "backend-features": {
                      "transports": [],
                      "dev-features": []
                   },
                   "start-on-kick": false,
                   "isr": 0,
                   "broken": false,
                   "status": {
                      "statuses": ["ACKNOWLEDGE", "DRIVER", "FEATURES_OK", "DRIVER_OK"]
                   },
                   "num-vqs": 3,
                   "guest-features": {
                      "transports": ["EVENT_IDX", "INDIRECT_DESC", "VERSION_1"],
                      "dev-features": []
                   },
                   "host-features": {
                      "transports": ["PROTOCOL_FEATURES", "EVENT_IDX", "INDIRECT_DESC", "VERSION_1",
                                     "ANY_LAYOUT", "NOTIFY_ON_EMPTY"],
                      "dev-features": []
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
            used_idx:             27
            signalled_used:       27
            signalled_used_valid: true
            VRing:
                num:          64
                num_default:  64
                align:        4096
                desc:         0x00000001342b5000
                avail:        0x00000001342b5400
                used:         0x00000001342b54c0

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
                   "signalled-used": 27,
                   "inuse": 0,
                   "vring-align": 4096,
                   "vring-desc": 5170221056,
                   "signalled-used-valid": true,
                   "vring-num-default": 64,
                   "vring-avail": 5170222080,
                   "queue-index": 2,
                   "vring-used": 5170222272,
                   "used-idx": 27,
                   "name": "virtio-net",
                   "vring-num": 64 }
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
                desc:        0x00007f31c032c000
                desc_phys:   0x00000001340c6000
                desc_size:   4096
                avail:       0x00007f31c032d000
                avail_phys:  0x00000001340c7000
                avail_size:  518
                used:        0x00007f31c032d240
                used_phys:   0x00000001340c7240
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
                   "avail-phys": 5168197632,
                   "used-phys": 5168198208,
                   "avail-size": 518,
                   "desc-size": 4096,
                   "used-size": 2054,
                   "desc": 139851654676480,
                   "num": 256,
                   "name": "virtio-net",
                   "call": 0,
                   "avail": 139851654680576,
                   "desc-phys": 5168193536,
                   "used": 139851654681152,
                   "kick": 0 }
           }

5. Display an element of a given virtio queue

HMP Form:

    info virtio-queue-element <path> <queue> [index]

    Example:

        Dump the information of the head element of the third queue of virtio-scsi:

        (qemu) info virtio-queue-element /machine/peripheral-anon/device[2]/virtio-backend 2
        /machine/peripheral-anon/device[2]/virtio-backend:
            device_name: virtio-scsi
            index:       125
            desc:
               descs:   addr 0xa4f90f1d0653b5fc len 1862028160 (used, avail, next)
            avail:
               flags: 0
               idx:   2936
               ring:  125
            used:
               flags: 0
               idx:   2936

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
                   "index": 125,
                   "name": "virtio-scsi",
                   "descs": [
                      { "flags": ["used", "avail", "next"],
                        "len": 1862028160,
                        "addr": 11887549308755752444 }
                   ],
                   "avail": {
                      "idx": 2936,
                      "flags": 0,
                      "ring": 125
                   },
                   "used": {
                      "idx": 2936,
                      "flags": 0
                   }
             }
           }

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

Jonah Palmer (2):
  virtio: drop name parameter for virtio_init()
  virtio: add vhost support for virtio devices

Laurent Vivier (6):
  qmp: add QMP command x-query-virtio
  qmp: add QMP command x-query-virtio-status
  qmp: decode feature & status bits in virtio-status
  qmp: add QMP commands for virtio/vhost queue-status
  qmp: add QMP command x-query-virtio-queue-element
  hmp: add virtio commands

 hmp-commands-info.hx                   |  70 +++
 hw/9pfs/virtio-9p-device.c             |   2 +-
 hw/block/vhost-user-blk.c              |   9 +-
 hw/block/virtio-blk.c                  |  31 +-
 hw/char/virtio-serial-bus.c            |  14 +-
 hw/display/vhost-user-gpu.c            |   7 +
 hw/display/virtio-gpu-base.c           |  20 +-
 hw/input/vhost-user-input.c            |   7 +
 hw/input/virtio-input.c                |  13 +-
 hw/net/virtio-net.c                    |  58 ++-
 hw/scsi/vhost-scsi.c                   |   8 +
 hw/scsi/virtio-scsi.c                  |  20 +-
 hw/virtio/meson.build                  |   2 +
 hw/virtio/vhost-user-fs.c              |  20 +-
 hw/virtio/vhost-user-i2c.c             |   7 +-
 hw/virtio/vhost-user-rng.c             |   9 +-
 hw/virtio/vhost-user-vsock.c           |   2 +-
 hw/virtio/vhost-vsock-common.c         |  22 +-
 hw/virtio/vhost-vsock.c                |   2 +-
 hw/virtio/vhost.c                      |   4 +-
 hw/virtio/virtio-balloon.c             |  17 +-
 hw/virtio/virtio-crypto.c              |  22 +-
 hw/virtio/virtio-iommu.c               |  17 +-
 hw/virtio/virtio-mem.c                 |  14 +-
 hw/virtio/virtio-pmem.c                |   3 +-
 hw/virtio/virtio-rng.c                 |   2 +-
 hw/virtio/virtio-stub.c                |  42 ++
 hw/virtio/virtio.c                     | 742 ++++++++++++++++++++++++++++-
 include/hw/virtio/vhost-vsock-common.h |   2 +-
 include/hw/virtio/vhost.h              |   3 +
 include/hw/virtio/virtio-gpu.h         |   3 +-
 include/hw/virtio/virtio.h             |  26 +-
 include/monitor/hmp.h                  |   5 +
 monitor/hmp-cmds.c                     | 311 ++++++++++++
 qapi/meson.build                       |   1 +
 qapi/qapi-schema.json                  |   1 +
 qapi/virtio.json                       | 841 +++++++++++++++++++++++++++++++++
 tests/qtest/qmp-cmd-test.c             |   1 +
 38 files changed, 2335 insertions(+), 45 deletions(-)
 create mode 100644 hw/virtio/virtio-stub.c
 create mode 100644 qapi/virtio.json

-- 
1.8.3.1


