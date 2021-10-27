Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0B443CD1F
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 17:10:04 +0200 (CEST)
Received: from localhost ([::1]:36270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfkZ0-0002JX-NE
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 11:10:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mfjYr-0000tY-0P
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 10:05:49 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:39689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mfjYn-0005cN-TS
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 10:05:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=hEeG/4SRebofxOZFLZqx11DEwYH/8UzBFqHv+vpicAs=; b=DSNCqBKXFz1NxQ4DNdYF050Thf
 srEH6leWzWWP143P8QrP0bLhnwobKGuL+ALyIgw7Pba7GMybCrdQmo/fWnK7fhRERnCvjmXbQjmvx
 Tcz+JYyP46oVXdk50S3dkQK4mEiBSMKeJiK3lWfRSuGf79f9eEEDqpEpBwv4hl4ESu6dGcav/Yf/7
 EElg52zVVwwUk+P+bM7wdsIVGghp0aGSefwsPNv4Un9Vsmu4lvKEmezoFUnq0IvBRIQHXY76sb6fF
 jbtKHVRHtZ1akxPyvIosNro2oPvv/yz93O50onoRJoylN2e1B+SrP4PbJFeCB2guC8kEVkaBmYdsl
 qCG2esD9rv6nY4LMHpoFPbzG+GtRPS8im71YQ4RxsDhsg/gE+AnL6TTDhNZsFNIvhRxi3mn6k9fqN
 XRLWCFCt/4Plm+WZcFWEZfzCgeR8Bfqdq6qgtOugi03g+Wa45hjPFYrffMW0GiGBSCn4PgbfCtQSn
 H8L3wQD8O7JdHveVwtAyeu7BiXoPSOSoGW22OIJp3cVNIdYZ1uhADTzL/1tSHKKTH2ApLba6kA2Is
 dy1uMRcwM4fQ1WIbhdg/gzHFfRB59sP0pSim04XQVAFcTLuw3ygTkJgtpxFkdV000FFg1NRYZvpk4
 OGOkYJuCQ8lWArvi3k4WJxO0ZUA4nkDzGe1DunQPs=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Subject: Re: [PULL 0/8] 9p queue 2021-10-27
Date: Wed, 27 Oct 2021 16:05:39 +0200
Message-ID: <1763549.VT83FdeJ1q@silver>
In-Reply-To: <cover.1635340713.git.qemu_oss@crudebyte.com>
References: <cover.1635340713.git.qemu_oss@crudebyte.com>
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

On Mittwoch, 27. Oktober 2021 15:18:33 CEST Christian Schoenebeck wrote:
> The following changes since commit 931ce30859176f0f7daac6bac255dae5eb21284e:
> 
>   Merge remote-tracking branch 'remotes/dagrh/tags/pull-virtiofs-20211026'
> into staging (2021-10-26 07:38:41 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/cschoenebeck/qemu.git tags/pull-9p-20211027
> 
> for you to fetch changes up to 7e985780aaab93d2c5be9b62d8d386568dfb071e:
> 
>   9pfs: use P9Array in v9fs_walk() (2021-10-27 14:45:22 +0200)
> 
> ----------------------------------------------------------------
> 9pfs: performance fix and cleanup
> 
> * First patch fixes suboptimal I/O performance on guest due to previously
>   incorrect block size being transmitted to 9p client.
> 
> * Subsequent patches are cleanup ones intended to reduce code complexity.
> 
> ----------------------------------------------------------------
> Christian Schoenebeck (8):
>       9pfs: fix wrong I/O block size in Rgetattr
>       9pfs: deduplicate iounit code
>       9pfs: simplify blksize_to_iounit()
>       9pfs: introduce P9Array
>       fsdev/p9array.h: check scalar type in P9ARRAY_NEW()
>       9pfs: make V9fsString usable via P9Array API
>       9pfs: make V9fsPath usable via P9Array API
>       9pfs: use P9Array in v9fs_walk()
> 
>  fsdev/9p-marshal.c |   2 +
>  fsdev/9p-marshal.h |   3 +
>  fsdev/file-op-9p.h |   2 +
>  fsdev/p9array.h    | 160
> +++++++++++++++++++++++++++++++++++++++++++++++++++++ hw/9pfs/9p.c       | 
> 70 +++++++++++++----------
>  5 files changed, 208 insertions(+), 29 deletions(-)
>  create mode 100644 fsdev/p9array.h

Regarding last 5 patches: Daniel raised a concern that not using g_autoptr 
would deviate from current QEMU coding patterns:
https://lists.gnu.org/archive/html/qemu-devel/2021-10/msg00081.html

Unfortunately I saw no way to address his concern without adding unnecessary 
code complexity, so I decided to make this a 9p local type (QArray -> P9Array) 
for now, which can easily be replaced in future (e.g. when there will be 
something appropriate on glib side).

Best regards,
Christian Schoenebeck



