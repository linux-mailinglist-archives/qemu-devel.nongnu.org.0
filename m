Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAFB686AA3
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 16:48:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNFKR-0007yB-JY; Wed, 01 Feb 2023 10:47:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNFKI-0007vk-9Q
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 10:47:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNFKG-0002ok-EI
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 10:47:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675266426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NYxwErVGBpwRXD01EtqUBaKPTglYtH7KtJfEeIwE9UE=;
 b=iyBzi0cM0UuNfxYqVPhK6liHUPMRvn+lGFyAtpdyJM1Zvv7s8AirnEPD5cfD4WlIuPiPtb
 a0UvOUlS8Ds9RheU59QQfdQaKy1P9Hf3+f0BWn8Rms6WjGjgnB/I105dIWp9zYTBQIs9f5
 o59IKIdVX301xERhZke3GqIXfmYRml4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-P1IXA53IM7mtKyM7jxc0LA-1; Wed, 01 Feb 2023 10:47:03 -0500
X-MC-Unique: P1IXA53IM7mtKyM7jxc0LA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D43D8030CB;
 Wed,  1 Feb 2023 15:47:02 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DBD0E403D0C1;
 Wed,  1 Feb 2023 15:47:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CB45221E6A1F; Wed,  1 Feb 2023 16:47:00 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
Cc: qemu-devel@nongnu.org,  ysato@users.sourceforge.jp,
 alex.bennee@linaro.org,  pbonzini@redhat.com,  fam@euphon.net,
 peter.maydell@linaro.org,  philmd@linaro.org,  kwolf@redhat.com,
 hreitz@redhat.com
Subject: Re: [PATCH 1/9] Updated the FSF address in file hw/sh4/sh7750_regs.h
References: <bd7883e4dbedd5119c52a37f00a23a5dcef52610.1675234580.git.kkamran.bese16seecs@seecs.edu.pk>
Date: Wed, 01 Feb 2023 16:47:00 +0100
In-Reply-To: <bd7883e4dbedd5119c52a37f00a23a5dcef52610.1675234580.git.kkamran.bese16seecs@seecs.edu.pk>
 (Khadija Kamran's message of "Wed, 1 Feb 2023 12:39:42 +0500")
Message-ID: <87357pv157.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

I recommend to squash all the patches in this series into a single one.

Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk> writes:

> Signed-off-by: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
> ---

The text below this line will not become part of the commit message.
Please move it above your Signed-off-by: line.

> The Free Software Foundation moved to a new address and this file referred to their old location.
> The address should be updated and replaced to a pointer to <https://www.gnu.org/licenses/>
> This will resolve the issue #379 in the QEMU source repository
>
>  hw/sh4/sh7750_regs.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/hw/sh4/sh7750_regs.h b/hw/sh4/sh7750_regs.h
> index beb571d5e9..94043431e6 100644
> --- a/hw/sh4/sh7750_regs.h
> +++ b/hw/sh4/sh7750_regs.h
> @@ -22,8 +22,7 @@
>   * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
>   * General Public License for more details. You should have received
>   * a copy of the GNU General Public License along with RTEMS; see
> - * file COPYING. If not, write to the Free Software Foundation, 675
> - * Mass Ave, Cambridge, MA 02139, USA.
> + * file COPYING. If not, see <https://www.gnu.org/licenses/>.
>   *
>   * As a special exception, including RTEMS header files in a file,
>   * instantiating RTEMS generics or templates, or linking other files


