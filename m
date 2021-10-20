Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C95F34355E1
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 00:31:14 +0200 (CEST)
Received: from localhost ([::1]:54312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdK77-0004wv-Pu
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 18:31:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdK3b-0002If-RN
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 18:27:35 -0400
Received: from mail-eopbgr740135.outbound.protection.outlook.com
 ([40.107.74.135]:53168 helo=NAM01-BN3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdK3a-0006qY-Ax
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 18:27:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mUPXQ5sUJqBvhje7GrV20Eu2J0mSJKcdLFdu+4a83K0liMoTCQ6iFf23f8fBurs3gbNWRI9QZZFQfSw/HqQoaze0dD/pf6EJrPewkFBfvWUyISj+wEQ5w1Kmn6Yog5HWQJzCZjYaKOAVBmaxKwwHFYc34OcbneY6kbZoKOnEXcgrUgVoZTGfw+6gz9FVEgUNrx8mq0FaDIjmwCXiLzjeiHBiLAX3IYAMXkqR6eKrwbeT9WC599YNMRmdOGxg54SbniOkuIGlciHnYPG99A2k1Xtmlyaj2zIts5V1Nja3leyRw9eVauYjtFqfs8kNMY4jTbEWOD+fTKxUx9ZO9svjkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j290QCNNNz036GUUiFIIgyTvHM1dd7xXUMQ2UVQXH2Y=;
 b=mm7zaIL0bLE+Cv5NN7/pWZbIItc/4DjxoGTifGIpUn/zkznl+JVOgypKhL+FQl0fXlocDAutaLrfC7IQMNOlnfjj1XD97yPVc/zO4Vh4yUq96YsfokeEvfMr273wKwNbmWIuFp8HmQdfhm5Skm9gkXji9ZCl9f3CDcauqgNoEdTM1ao+WQdV8fdJLqqVHIQpe5O0N6/KTos837YD+8HCyxIdv8MM+9QXPS7p7IRrmLhceuZH943RFGt4R6qaviaXiLQ4xNkcMaPUcC1w64CG3WubIT2bxQ0SEXBC79F9IzhvoLZ3YYw5ZqvEAJEbZ6GLPRx+1xpnwxT/kIRHL2Gfnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j290QCNNNz036GUUiFIIgyTvHM1dd7xXUMQ2UVQXH2Y=;
 b=qzGexwBX7dWMyVgMQBco920xHiQtc/eKkYIBYKXIXv6pAUFxSDs+ShE2CmLge7uXptrSKSVavnkwP7tILBb+XTfYLHWURyxhgC2DGRB5YhZc6q+qnkLW+FBgnCl7B8WfrCYS0Wc1WBXrcHuHPcR9HnCIawxSTNgVh4NJRpYk9MB/JioATLee9V2hdeGgW9NDlINm6oVg8wqp4YcppYtnP+NynZ3K22mtWg1SJ/+YwR7FMlQ/lc1KmweHW5Ni00GizcB+TVT4cUk7eu4la1SQyzijrETKj6QYc27m6bPkHsDkU/ZIh6raegoIALyyCXQ/v8TSHpUxuQO4F7UXFxTh9g==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP2PR80MB4482.lamprd80.prod.outlook.com (2603:10d6:102:49::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Wed, 20 Oct
 2021 22:27:16 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4608.019; Wed, 20 Oct 2021
 22:27:16 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v2 08/48] tcg/optimize: Split out fold_call
Thread-Topic: [PATCH v2 08/48] tcg/optimize: Split out fold_call
Thread-Index: AQHXu7cHBA1ZiviN7Eq5MvsyuHNTi6vchfTg
Date: Wed, 20 Oct 2021 22:27:16 +0000
Message-ID: <CPXPR80MB5224A99463D082DBB89D78ACDABE9@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
 <20211007195456.1168070-9-richard.henderson@linaro.org>
In-Reply-To: <20211007195456.1168070-9-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a34d87e7-746e-46db-673b-08d99418c59d
x-ms-traffictypediagnostic: CP2PR80MB4482:
x-microsoft-antispam-prvs: <CP2PR80MB4482600CB75B29B53C65EC4ADABE9@CP2PR80MB4482.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1443;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wcY6iywMCMv/3plczIyJCAlshQqOjII98ZpqcRtPDBk0Vl/9qxpl56nAIddBRofloDCS6cjZvjv8UAtYozuHm6UgyKDoUVTT0DEkZaLNGc3U8W24bkgebZyM/6V0d5JgpDCyGJ8vUyZciY3DitVI6yR+Ddn/em/tqwDDHJB+Fu3BMZ01PKBqGbigPwDXy2cyV25iZ76uZfnGG+lsW3f77biibDxoLpVaj4qN5ErC91MpZp3+w/5Do+TkZr9rHRHn3HvyqmKnqoZxqFudNNTBKLiug7MlBy/YUzH3R4DXc+wCWzEstlxtyqpeA139FQ07EwC4ZNKp5utOc+jf2zh7dUCnKC8ECQ79SFkdtBOx8UwM5vz+76rEARJz2LhC/HmcNXLEbQwNpzc0jd2cJoZ1z6Eh8rs2o0JL5PTb9n1ti0lDejeFNJiwursEI3q8hddbj+udPG2ag8frKHY0H7Bi2DYKtP6klQQOtpzGQUONZNao+KoUSAdb9wRA9HqALcQVewnMUPYIgfam1V21Sd/mAlGefmo66NoMGNYv9bCyWp0+Z7m5q+Yvc1IYp0R+o1ePgsQW5flbpiDGCDQz1t0q9vGcTJtyRWVYLcb7ALp5Z3pjtjPR0EiWSEvMLGshbApbC80RKAThKGDLlSTmQsUh9cDsHJp7IXKV83bd2JNFbtMlhEbnrlOyWyMPdAFQCBGu/90ipNu6Fqh5vVHAMGTM+hE0uq17RiLw36Mjpndvemosdgy6zKawM16492OE5DUm4ADGSPal2OOHPtelZQelHLpuH3lxdLgexTV9mTyalm0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(66476007)(64756008)(110136005)(52536014)(122000001)(33656002)(316002)(26005)(2906002)(83380400001)(508600001)(76116006)(86362001)(9686003)(55016002)(7696005)(38100700002)(66556008)(66446008)(8676002)(6506007)(4744005)(66946007)(186003)(71200400001)(5660300002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?n1ceWpH2vJwr8HMekZgUloRJIZI2XcRFhME8zIM5nHjuKNK17YI50mBo461h?=
 =?us-ascii?Q?+eRtGg4vrR7sFMD9+96LPSIxA/tIW4n7psf2zWr7vGgKFgFsscufq1q95eIg?=
 =?us-ascii?Q?hj/pQmnV5/s83O/ZhaF6tSEHsgZSEoKSmgH8iRhrCUQUMo8lj+xkXFKoP/LZ?=
 =?us-ascii?Q?tN9sXy/AWkBMjdWsZsMlbFJxoWy8axbEmAjN+Gh4L0QXslsqQV2v7tGooHC0?=
 =?us-ascii?Q?8FsXyIZg5XOSkR2Coi4CcGZvOJwvnUkVpGJW0rj9tAisEci6ThGiL1Yf398r?=
 =?us-ascii?Q?drVi5rfXK48Nv6hCwkUHfdBUpy1oMBppfpm8gKvpRgy7voU8G3Eh3KSSxkiI?=
 =?us-ascii?Q?1h6RUTW9eKqDL6j9XROSXyjn3wq/iHe+p8HT6yT/tqn5OihEsp/CLLm7zgVY?=
 =?us-ascii?Q?g0rCBfKIz5BR6gLPXz93l+kCLKxQYeS49XJcwkEz9vKNn+ao5n3rZXjyTkn6?=
 =?us-ascii?Q?13hZR6AoPckA+lHJao+qjxjE/pgz/TtTVZMos8cgaHxkH0ux7ampLkn7CP4H?=
 =?us-ascii?Q?YZTf2RyCfWCOaNmeffApIPhwL6bhKYo6Lb+qwvlEII6/CkGyPboF6xQRC9NA?=
 =?us-ascii?Q?TK8SNzl2PhKVfGixH5FEhroFae+NT0xH/6DPGLh0vYIciFby5Yc8TPmiFd9D?=
 =?us-ascii?Q?MwfuItLdS/x5Vjyvv42O1IU+E9r8bWHi5QbfWk5I8B7D9GHjDSRHpD8rCVk3?=
 =?us-ascii?Q?aVMm/NMe5tq4+043zqRGAsG35dnWQbPsS3gkDgHeiXz5QboP/wUvNoDWD0k2?=
 =?us-ascii?Q?U5f1tQAz9K7XUNeVYu0o0hQVsSXotLwofIIN4RyYVKCRmClW1iboOy9R1WJ2?=
 =?us-ascii?Q?BghInqUi4z7c5KKYQV0lImSIEaQAI6RQ76wKmbUIj/U06DbNWpeiUHSzGJsz?=
 =?us-ascii?Q?eZw7duZJbFQMbJFOUIcvEvfu2y1RGjqFymWGor1Lf3NGfVvdwJwlZDN5vr0/?=
 =?us-ascii?Q?clZiFsJD9pjzU6j68zSlnhZ3X8CUECRPWWQcYoMGUbRSZlRKWII0q2mfJAAn?=
 =?us-ascii?Q?r1tV+t8NkDnBzFibCs1tUYZkzkDadVwonhP5TPUbLPRun0dlG1GdthbEIenz?=
 =?us-ascii?Q?9476k216C0pKsCYrMFuJk8k6D8z0WzCPg0HEp3FgMchWbCGdCIjKQC+7lIdG?=
 =?us-ascii?Q?ha+52/o7n8VO6raKwg12u+V822hfq5VE2/sy8IsSnyW41HEQ+kTHmp8Enuxb?=
 =?us-ascii?Q?hCLRq1Tg3UvHjrlmEMTGmQeigyOeFk0bXp3QcrFLes1rP/RdMSZVvAYab6Ub?=
 =?us-ascii?Q?JQR/aWdYO6nQ5g5+PBq05i06QGmFA/D7zEKnhuUF9tE9d6OgTRAMyeVpvAor?=
 =?us-ascii?Q?RsHZhoJleHPTS7L8h6FGfDgm?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a34d87e7-746e-46db-673b-08d99418c59d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2021 22:27:16.3999 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cjxb48@eldorado.org.br
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB4482
Received-SPF: pass client-ip=40.107.74.135;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM01-BN3-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_20=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>
> Calls are special in that they have a variable number of arguments, and n=
eed to
> be able to clobber globals.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 63 ++++++++++++++++++++++++++++++++------------------
>  1 file changed, 41 insertions(+), 22 deletions(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

