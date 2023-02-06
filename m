Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 401E168CAC8
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 00:46:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPBBH-000635-DL; Mon, 06 Feb 2023 18:45:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1pPBB8-00061J-Ec
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 18:45:43 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1pPBB5-0008Eh-Db
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 18:45:41 -0500
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 316KESU2009779; Mon, 6 Feb 2023 23:45:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2022-7-12;
 bh=HkaBaRL+ZwFGS951fjDpQkEvThfBb62coYc7KELuFv4=;
 b=XQRxAuvYl8UIH0F28hVZE4pHoOveVkMJO8aWkH0eSj3joVFbhaOlI7ZLShol2qilYKw9
 fv9nRbsCsusuV+30hcenrNJZwdNJIdE0lfP+zIChMQJLVbgnI362PLxg0vSBAnyHNIuk
 trdBTBqI8Ta2wiY5RC+rdRcgv3SDtWEjOQ7Lce1vJU6eju6JRYmK4qOQhLGbAcUXO9Q/
 LEupoKWEZhXiiHbc9R+aOG8MTBsIYp6IL3dGz4ui3jypDSL6XdpH4QX0W6zQIDCQdkNi
 XJCIc+bRjSB5mzkpZfm0EvOYg2IbswKuGnvf1Zok/JT1lo6JrTvbHnmk1Mpg/lSac/Ns Wg== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nhe9nc7qb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Feb 2023 23:45:35 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 316Ngn1X016804; Mon, 6 Feb 2023 23:45:34 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3njrb9b3gg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Feb 2023 23:45:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LeQ9RHZ0zIOIcXH9WlDblm+PKl0JzD0SpSPNBdkS3BqUIPcTPOZA0mqwde49LkTpX3AG+oJYr7Dv+9xlsDG48dYTnFQKN86xL6zEzdoHzGzdbSzYZAiMWQB1Lgew+VLDLEfkZhgasR8CTLZEPursk9eVrUp1FEN9ppgUrPix2+nc5pvonN4nMa01mHGF2arEb+DzHobtAl8Nv7FDrPpbL+MiVhI2wdrzuS77qPGTT1Fj9k+N5bRTnA3GE9Feqvxu26ccuoozewJLa8VHTAm+hrH4mhGyrn2nBdkoBj2FlMo/6otWfkbwiIJlKKkb2jJ/3r9XaomSiZC8izvsBrfSNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HkaBaRL+ZwFGS951fjDpQkEvThfBb62coYc7KELuFv4=;
 b=kc1izm+Qo2Kf5Zy+NcEuExgLMzuSBefDsCup6SHfiAjV7cvJC1LFeAGUWov9E0VjofdFdTY47sUwVDO+XiOgrBiMdcus/mqyDaeEDvgoKsbfHOx9wvKzLywX7KPLXyd7VD9907WZzbCVcRpWw8KWrBTVEW61aJM6dDLlXmzUdi6pq78SkDyPitc7ZeQ44uMJH4V/NzL7/f7v+ZvLMXvnr24GAmrJdy0pe7EXE4tUrJ22UcUczgZoU21nJYxpdtV6gK+HRZjcuMQebCImucKTygzpZ6OB11wBQMW9TBeXuIpcGnJANfCRD1ihNIlhhHlN6h1pkgaDjRif7fwe3dbxTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HkaBaRL+ZwFGS951fjDpQkEvThfBb62coYc7KELuFv4=;
 b=ZrRJBTUjxBWL/QSk8NoBuLVV02jQ10n0KqpqURfoB+sIhDekdSwxP1vvPD8nEk5qWWn/5B/Q55PVzUKZ9hx6G+S/ennYuIdsAoGlJa558RZLwjrTJlVbgweiHFe/TL98oHpozBfFweYsZjh/0Smp9ROvAKWgR0z0WPuzk5YjuMc=
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by MN2PR10MB4141.namprd10.prod.outlook.com (2603:10b6:208:1df::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.24; Mon, 6 Feb
 2023 23:42:51 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::d3a9:5199:9c2:e8fe]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::d3a9:5199:9c2:e8fe%4]) with mapi id 15.20.6086.009; Mon, 6 Feb 2023
 23:42:51 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, richard.henderson@linaro.org, pbonzini@redhat.com,
 joe.jin@oracle.com
Subject: [PATCH 1/1] hw/core/cpu: always print cpu index with cpu state
Date: Mon,  6 Feb 2023 15:42:20 -0800
Message-Id: <20230206234220.8414-1-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0082.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::27) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB2663:EE_|MN2PR10MB4141:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a10225d-4e59-4495-5a57-08db089bdc07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aL6eSj42PvYoV4pj2+pMIR5gPX7QEEfBwE+1gIpmPxmyfrQtFe09BmSJ1N4albA7/h1kn6VNabyCSfcHvomZrqVucTh3lU27cQVPvXwF94jLZDUP+qGf1QuuYFLuf3OFmdocP8EK4NswEtpkaNAQp3i16JklQd4FeQEMz3AhLJuwbK8n/FOVgbiCa3Jh61CdfpZJeYYLakNwi8GHSabbokNHdJwTLdGIFws8jlZGa3yEvzxmcMgvy74cl6fDqnNmKMdlEwYa+MQT2Oi40EYY/EvnZZvCkKHkSQJ4ysiIhBR963p3ebMmYmkJBVb3I2ACsoijUoliV4UiXVmbzcTP1IPYAFtB1cLV5EqlXDSHrc/n3H2qDsop0I2fuitVymgIq+PYZ/nK640JeyRZR10C6SS6dtZFbZq+/anK0ISB0bc4fc9I4371TF6syUjSWq/9gMMi0Sp+vt4xwQvlkJPnaEH25nnasLD6HNlGwqwznG8X3mmn3H1nEPHN/VNDT6JsaIbVmRNymV0SrAmO3/+fGsUF5x59RlxjR1pVwAsCnBtybRKt3nbejrkBlCWiJuc4pSzlfkevSMZaXIGiiX3v8nShIwBv/YEGQRoFmZmz4kanTCIbUcb/a3Q43c0nhcQkyr1Sx4Gvdz/v/DA4u4VJ1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(39860400002)(136003)(346002)(376002)(396003)(451199018)(41300700001)(66946007)(316002)(66556008)(5660300002)(8936002)(44832011)(2906002)(86362001)(36756003)(38100700002)(66476007)(6916009)(8676002)(83380400001)(4326008)(478600001)(2616005)(6486002)(6512007)(6506007)(186003)(1076003)(26005)(107886003)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qFt4s8Y6UQismudKTO0URrsXWgIuzniIS5obKHodzt8FkNLQ0Nc+WASMUXqt?=
 =?us-ascii?Q?kYReYLeR3F+C4g5s9GjEhfvngX3RZ4PsJ3gLPxRbL7eyzlzUNpSakzRjXNAV?=
 =?us-ascii?Q?Jfduujb4x5AxdxebFDjHeSbfq4gekpF0HQbAK4tesnZenF68Ccfxof+Tf27h?=
 =?us-ascii?Q?thrW29NZzILTXknbQMv1XoGScXHBwnA2JwC6X+Ms1904JaRimmuVG7ttbfSI?=
 =?us-ascii?Q?N/ONYfe7azRkmtVN+Ho50W7N6b+UkOVg+1P8GDX+nuSsll04uqoksCtQCBBN?=
 =?us-ascii?Q?HPFf1zbNTPZJ+foehl47pz6PQLotWsOjKfTrNp4DrgTgwDsne0lCAMwUWzcb?=
 =?us-ascii?Q?0x41/NB+bNISSheENwkE+DM4AThf8+r9lhiklYo65/uOXNJG9fa1ulKtjogQ?=
 =?us-ascii?Q?qDkl1tcCVPXlgVgUvt3MtQBqaMTdhXmdpKgIMGtZq8b7aSsa/ucTLYQDPDiu?=
 =?us-ascii?Q?OgKLAk5OjvW7jLgvTeq5h7k/UFEy3bLbZ0I6FJRqI3+w3R07rL7cNL0VNywI?=
 =?us-ascii?Q?4iBgvWPwIWQUjTmOtZ4Xcak8xp7hfJJ99Q6DefdKdYu7DcgFd/PqdP93b0W+?=
 =?us-ascii?Q?r0C0dUqkTYrP8Al1Xo5eyLgnUrLFb7tL1kUpmaJwPvYBKsZm1eb3nVMLkft9?=
 =?us-ascii?Q?+Wy2hsnvfNqDOEmjSYQBL7+vGuQ4uY+XQf2xLr/ULejBqhg+e+XvnVAkDmea?=
 =?us-ascii?Q?xwKspzJMJbYyarMhzNBkyVKwuLaSeb5dV3ag5vjyJOihBipWKyRtAicYr78J?=
 =?us-ascii?Q?T1sPsAsTZDFf4FyIMTkSRJvGOmqba6nzpr2OXMA9O9hySL+iY0J3c4uiwVvy?=
 =?us-ascii?Q?aQ958coB/PAIgQQZLgv54EgO7n4+daH+h3lszEGAPcq0gn77xR4h8e79AQUJ?=
 =?us-ascii?Q?4+prfwlyQqSZiSZINnsXCahIqafK1miTFsQyOw5p/eVTm4rF5Y1E3agWKuf+?=
 =?us-ascii?Q?QNbT+CcYI6uLJd9p5tAIMfxxu14zTugvR6b9+izqge6M7kUfhuLrR3AmstIF?=
 =?us-ascii?Q?F8RUFiMTcYyTahwZqvQlzqZyoGlNvo7d65EiVVUsnGC0s0kIzGkB4/SESeYy?=
 =?us-ascii?Q?8OTHBEWwB22yyFaSrYUDnYlUGtN7/eAud9BUdQv0mm+ozOeZaAI6b5/D4UJb?=
 =?us-ascii?Q?yTmp7zzGzgZfdJ7wpzgIGfQaPrM9vd8ErJKt1fhZ3uw8fo4Fd0HDb5v3q2Oc?=
 =?us-ascii?Q?IjmVVplU51tJAnV4HGMsrLEgevlGuPKTcfWVyS/Toe2cZhALtZCZMRaLqAyF?=
 =?us-ascii?Q?q0qzt5U+v1D6su0fJFv/ROINEbTjnRM34AdjUs63Bsxzlz0q+fVHG1FsM1Hz?=
 =?us-ascii?Q?3mP/v9eIcuHMrcsvldMwhh17RClPf3G5JPxmMzwHmKxztz0Fsz11ehM/aOM3?=
 =?us-ascii?Q?76Yz2cxyD6Nl9SLju0CKyIQTKNJOziZAj219tr9aPe/c8WMPyehCCaV+m0SL?=
 =?us-ascii?Q?xYGcUpLBUr4XlqYQSXq4cbp6oIFbzbrJbyUsgcBjouKBwp9MVFMNncXugTxx?=
 =?us-ascii?Q?/hOtNxtGN+cSRHJB3SQSUWyt5VMdSXSanq6irPJuQmLJV+mF8Oka4BuFrOFn?=
 =?us-ascii?Q?Sph/yE+6HbiFAI84pEo8Js+e1EiAvMYOeZaZRnRWa2RzEWqO0d9UVcIBT6AH?=
 =?us-ascii?Q?rw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: /89qtrgUU6qowws5jqLhGW4UfrjNl5WE4cArLqzATkcs38DN3ZxMoResYKVPMZ4VObk5ylNgxNMKu2cs97y3BUHz0v/ItGNbCjVpjZU8spo/D2Kg/i2JlEJzQ1CPWXE/uOAlkZQCACrYZ7gERVSbXq4WWR0K4OMbwwmOWvzyZiJIi/WEHA04ZrIcdc6B4Oz1p3PmtvHZfg0p0mChrX1rncLs/T7jca2zSUiU0uzAGIOKz2qNByG2ghYGIicAf/F7qp050z9BkMxbdskKzP9MFTMKAUBM0X+P5EcSeVy3ahFEzC+cRoKt0nJdguQIH7HEwJ8D+rm3gTZLj2ynyyOSw9+dUExWIFRSYQnGvI4BE9CL7oEDhTQHe6npvzre409BZkBo2/Jldvf/MW2g4sutz6DBV+LZwmZFqyjsNR7oVUtIHeXHeOUZS+nSANqhpKjFuwQ0sHZmXmbwlfsjatUUNZGlcolFLVSVAgjy0bFsEypp7yOvsLcTV8de4wbKozFcNqKES5VsqgRxIbjwVONt7vjc2/CNebc2rBwuFYxcBdxHkhGM42iHKknnaxNrcwO7bmD7eoPRZomNn09FxkKzz9wc0i/aMl6Ob44uHN7BKFBGQDOWNHtxxdMegW4HEzruY2P4v/Mrp64zvOEnSnY4vZ+ahze9tKDJVhCDpugRBCzMUNYZE+9Z1xM6ZM9tZBvfk6VfNgOI1AyyGbJR0euenCzQZuIEgbaUcGoBhJdkqsiP6wUyTeOZkv/O5jyIqugQZkYMsfeOSVhdoBk03yLps4o8IFRP7oL6LQZO1rx5x/8H2v5YrndzcwFx8IO9d4vn
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a10225d-4e59-4495-5a57-08db089bdc07
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 23:42:50.9666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5xM0QYsJrLfgKx7f5umSNFKppN9WHufeE+7YXvOppJpHP5DNGdE1peu+hwRlgo9XgU4R3qw8nzl4g/2tHpkvMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4141
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-06_07,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 spamscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302060205
X-Proofpoint-ORIG-GUID: e-S8oeFYSQ9j5uW-d9YnXSh7t3wL3YSn
X-Proofpoint-GUID: e-S8oeFYSQ9j5uW-d9YnXSh7t3wL3YSn
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=dongli.zhang@oracle.com; helo=mx0a-00069f02.pphosted.com
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

The cpu_dump_state() does not print the cpu index. When the
cpu_dump_state() is invoked due to the KVM failure, we are not able to tell
from which CPU the state is. The below is an example.

KVM internal error. Suberror: 764064
RAX=0000000000000002 RBX=ffff8a9e57c38400 RCX=00000000ffffffff RDX=ffff8a9cc00ba8a0
RSI=0000000000000003 RDI=ffff8a9e57c38400 RBP=ffffb6120c5b3c50 RSP=ffffb6120c5b3c40
R8 =0000000000000000 R9 =ffff8a9cc00ba8a0 R10=ffffffff8e467350 R11=0000000000000007
R12=000000000000000a R13=ffffffff8f987e25 R14=ffffffff8f988a01 R15=0000000000000000
RIP=ffffffff8e51bb04 RFL=00010046 [---Z-P-] CPL=0 II=0 A20=1 SMM=0 HLT=0
ES =0000 0000000000000000 ffffffff 00c00000
CS =0010 0000000000000000 ffffffff 00a09b00 DPL=0 CS64 [-RA]
SS =0000 0000000000000000 ffffffff 00c00000
DS =0000 0000000000000000 ffffffff 00c00000
FS =0000 0000000000000000 ffffffff 00c00000
GS =0000 ffff8ac27fcc0000 ffffffff 00c00000
LDT=0000 0000000000000000 ffffffff 00c00000
TR =0040 fffffe0000096000 0000206f 00008b00 DPL=0 TSS64-busy
GDT=     fffffe0000094000 0000007f
IDT=     fffffe0000000000 00000fff
CR0=80050033 CR2=0000000000000000 CR3=00000010ca40a001 CR4=003606e0
DR0=0000000000000000 DR1=0000000000000000 DR2=0000000000000000 DR3=0000000000000000
DR6=00000000fffe0ff0 DR7=0000000000000400
EFER=0000000000000d01
Code=0f 1f ... ...

Print the cpu->cpu_index in cpu_dump_state() and remove it from the caller.

Cc: Joe Jin <joe.jin@oracle.com>
Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
 hw/core/cpu-common.c      | 1 +
 monitor/hmp-cmds-target.c | 2 --
 softmmu/cpus.c            | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index 5ccc3837b6..d2503f2d09 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -105,6 +105,7 @@ void cpu_dump_state(CPUState *cpu, FILE *f, int flags)
 
     if (cc->dump_state) {
         cpu_synchronize_state(cpu);
+        qemu_fprintf(f, "\nCPU#%d\n", cpu->cpu_index);
         cc->dump_state(cpu, f, flags);
     }
 }
diff --git a/monitor/hmp-cmds-target.c b/monitor/hmp-cmds-target.c
index 0d3e84d960..f7dd354d2a 100644
--- a/monitor/hmp-cmds-target.c
+++ b/monitor/hmp-cmds-target.c
@@ -99,7 +99,6 @@ void hmp_info_registers(Monitor *mon, const QDict *qdict)
 
     if (all_cpus) {
         CPU_FOREACH(cs) {
-            monitor_printf(mon, "\nCPU#%d\n", cs->cpu_index);
             cpu_dump_state(cs, NULL, CPU_DUMP_FPU);
         }
     } else {
@@ -114,7 +113,6 @@ void hmp_info_registers(Monitor *mon, const QDict *qdict)
             return;
         }
 
-        monitor_printf(mon, "\nCPU#%d\n", cs->cpu_index);
         cpu_dump_state(cs, NULL, CPU_DUMP_FPU);
     }
 }
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 9cbc8172b5..f69bbe6abc 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -122,7 +122,6 @@ void hw_error(const char *fmt, ...)
     vfprintf(stderr, fmt, ap);
     fprintf(stderr, "\n");
     CPU_FOREACH(cpu) {
-        fprintf(stderr, "CPU #%d:\n", cpu->cpu_index);
         cpu_dump_state(cpu, stderr, CPU_DUMP_FPU);
     }
     va_end(ap);
-- 
2.34.1


