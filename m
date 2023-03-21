Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DB46C34CD
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 15:54:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pedMj-00057w-NX; Tue, 21 Mar 2023 10:53:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew.jones@linux.dev>)
 id 1pedMh-00057X-Ov
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 10:53:31 -0400
Received: from out-25.mta0.migadu.com ([2001:41d0:1004:224b::19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew.jones@linux.dev>)
 id 1pedMg-0000Rc-8c
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 10:53:31 -0400
Date: Tue, 21 Mar 2023 15:53:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1679410408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v7nt2ZcLJI8v874JEFEjYqSymW12b5rJowFOtO9NW+s=;
 b=a+wfCfzb7+0szC1XzKTnNenvmBweKKpql/zf6uP0rwrey2NFzQ/HB3kibfl114mn8CYK4I
 CbqIbIQZ24Wf1W62V28WtzSAcWYSS/CNQEFecyaM1XuPUwv2q/1BJUJBSD/IDuw0+cB2GH
 3fI+oEds7aY/76gwmjP6XwcqF5khQjg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
 qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, kvmarm@lists.linux.dev,
 qemu-arm@nongnu.org
Subject: Re: [kvm-unit-tests PATCH v10 2/7] add .gitpublish metadata
Message-ID: <20230321145327.oetnj7ao7jxjp5ac@orel>
References: <20230307112845.452053-1-alex.bennee@linaro.org>
 <20230307112845.452053-3-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230307112845.452053-3-alex.bennee@linaro.org>
X-Migadu-Flow: FLOW_OUT
Received-SPF: pass client-ip=2001:41d0:1004:224b::19;
 envelope-from=andrew.jones@linux.dev; helo=out-25.mta0.migadu.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Tue, Mar 07, 2023 at 11:28:40AM +0000, Alex Bennée wrote:
> This allows for users of git-publish to have default routing for kvm
> and kvmarm patches.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  .gitpublish | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 .gitpublish
> 
> diff --git a/.gitpublish b/.gitpublish
> new file mode 100644
> index 00000000..39130f93
> --- /dev/null
> +++ b/.gitpublish
> @@ -0,0 +1,18 @@
> +#
> +# Common git-publish profiles that can be used to send patches to QEMU upstream.
> +#
> +# See https://github.com/stefanha/git-publish for more information
> +#
> +[gitpublishprofile "default"]
> +base = master
> +to = kvm@vger.kernel.org
> +cc = qemu-devel@nongnu.org
> +cccmd = scripts/get_maintainer.pl --noroles --norolestats --nogit --nogit-fallback 2>/dev/null
> +
> +[gitpublishprofile "arm"]
> +base = master
> +to = kvmarm@lists.cs.columbia.edu
> +cc = kvm@vger.kernel.org
> +cc = qemu-devel@nongnu.org
> +cc = qemu-arm@nongnu.org
> +cccmd = scripts/get_maintainer.pl --noroles --norolestats --nogit --nogit-fallback 2>/dev/null

Should we also set the prefix for these?

 prefix = kvm-unit-tests PATCH

And maybe even, 'signoff = true'?

Otherwise,

Acked-by: Andrew Jones <andrew.jones@linux.dev>

Thanks,
drew

