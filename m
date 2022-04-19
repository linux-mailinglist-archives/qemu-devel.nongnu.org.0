Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D789E506EF7
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 15:52:09 +0200 (CEST)
Received: from localhost ([::1]:50086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngoH2-0007H5-Ud
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 09:52:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ngoFZ-0005rS-BU
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 09:50:38 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:42329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ngoFU-0005sq-VZ
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 09:50:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=RyhJPiJokojtw6uq7M6CfHM04WffmTlqZGdte433Yxg=; b=eNMpDWfpO9+NUSZUk0Kktv9QQe
 9VPXUxZ8hhvfSWd35xq1ZKyz+V+FzsHHVZM2bHpbLkvQo2x38oWvfVvcVelqZn7bKAepkhDNOBByM
 VUCFWb84KCrFq9CLwFMQteeCtF1y0ogdd6WT7dx0OMU+IuAyPFG9zTDxxruxyO7xtXfdUrgA3Qlmb
 rnhaJBwTd3rffDpsSBwDQ/wpl0yzyp1EKlGsWxfeZwqa2TK8g0YCpRnIvpSSVe/VYD8dKRO4Ld4nr
 mkpvBOk01w2H3ECEEBT6YlskJmd9amIDiKBKsHusNzuIOTrd4CE1zgpcnb5vtZ9VkQjWbhSmv4yxB
 gBolIy8pzLTaVA0mtJI5ShcGwHd49r41m+k91UBwi2qHY2FQZGRlYYb13xTqpVgrqdGCqAL/eT1xy
 1d2sfqt+nsI3QbyNJ19/C5eItolV/ETNHHCSEPgJ391LA86K/7YQf4Sg7JkdXjLgGiLc6TEwEK6i8
 F/pR66L7Us9GuEsBDn7tA/iI2mtp9qSiMN78fDaIn88FfNNYMVqkY4w5wAljGUrrfER4Utqokr58o
 Zuty5BTn7rpewjr2+pcDjHDT9NjJu987BJ9BKTbMefXwwKXJNOynfaZzY/1m2imiET/JP+dFV3rks
 J8ovO2iFvk5XyMMEcY0LG3/QwGvmFoCrxaOtAKfXY=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: "Shi, Guohuai" <Guohuai.Shi@windriver.com>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Greg Kurz <groug@kaod.org>
Subject: Re: [RFC PATCH 0/4] 9pfs: Add 9pfs support for Windows host
Date: Tue, 19 Apr 2022 15:50:25 +0200
Message-ID: <2766319.qo5tFDDxnU@silver>
In-Reply-To: <CH2PR11MB44546FDCE43D78D455491310EFF29@CH2PR11MB4454.namprd11.prod.outlook.com>
References: <20220408171013.912436-1-bmeng.cn@gmail.com>
 <029ab612-79a5-7e1f-9db2-a3b85959c758@ilande.co.uk>
 <CH2PR11MB44546FDCE43D78D455491310EFF29@CH2PR11MB4454.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Dienstag, 19. April 2022 13:10:40 CEST Shi, Guohuai wrote:
> Hi All,
> 
> I just finished a basic PoC for mapped-file.
> It works! I think I can also support "security_model=map-xattr" by NTFS
> ADS.

Slick!
 
> However, I got a limitation of MinGW:
> 
> https://github.com/mirror/mingw-w64/blob/master/mingw-w64-crt/misc/dirent.c#
> L290
>  
> MinGW can not handle seekdir() while the directory has changed.
> That means, if run command like "rm -rf *", MinGW may not delete all files.
> "rm -rf *" need to call readdir()(and call seekdir() in 9P) and unlink(),
> and MinGW's seekdir() may seek directory to wrong directory entry index. 
> I am considering to change 9PFS readdir() implement on Windows host, to fix
> this problem.

To avoid history repeating [1]: please do not attempt to address this in 9p.c!
That file is the controller portion of 9p server and must remain fs-agnostic.
Such kind of issue should rather be addressed on fs driver level
(e.g. 9p-local.c, 9p-util-windows.c).

I.e. don't do it like this:
[1] https://lore.kernel.org/all/20211122004913.20052-1-wwcohen@gmail.com/T/#m734f405973768e43ce3ed7550bd21809abb25813

Best regards,
Christian Schoenebeck



