Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C52F16D05DB
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 15:05:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phrxr-0000PL-S8; Thu, 30 Mar 2023 09:05:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=446aa7e4f=anthony.perard@citrix.com>)
 id 1phrxp-0000N3-OJ
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 09:05:13 -0400
Received: from esa6.hc3370-68.iphmx.com ([216.71.155.175])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=446aa7e4f=anthony.perard@citrix.com>)
 id 1phrxo-0008DI-5q
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 09:05:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1680181512;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=adxcuJkdzQDMNqJ6me0RVhVLacrk4QCIJ2X+K9Tdhq8=;
 b=dHl9uvbiJGOmrQefFyIiK8Dpqc0BqqdVdLTFKcPaybWlbs4dJtVXQ+jF
 Zd+vDHAWfBjwHICy03ysc2bOC0CheG5tXRfVpWPZy68rNo2NGmgIBhXW/
 nmS8tDsAKlj9/x/dgQ52YtVSZKAyCQobhZzJIV+eilOnq6SybqhonwS1I s=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 103042006
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:1OiPjq1hsBrCh86AovbD5c12kn2cJEfYwER7XKvMYLTBsI5bpzVVy
 mUcCmmFPPqDYTHyctF/a9zl8kkDsMTWxtZgSVFtpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+HuDgNyo4GlD5gdlPagR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfHE5V8
 +YHM2o3clO7ucWqyqK+VcBxiZF2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tO6umnn4dSwesF+PrLA7y2PS0BZwwP7mN9+9ltmiHJ0OxhrC/
 jqYl4j/KjtHCs6W+SXGznGXnLHmpBjKWqgTDqLto5aGh3XMnzdOWXX6T2CTuvm0jFKzSvpQL
 kUV/mwlqq1a3FWmS8S4UxCmrXqsuBkaVNxNVeog52mlz6PO6AudQGEcQDNFYtU7sec5QDUr0
 hmCmNaBLSRlt7uHSHSc3q2ZoTO7JW4eKmpqTSMbSBQt6tzqsoY1yBnICMtgeIa1ltroAirxx
 RiQoSE1m7IIy8kR2M2T9E3djjatq57hRxMv6wGMBCSj4x8RTIOpeoWy5V/z7f9KL4GCUh+Hs
 WRss9CX8eQmHZyL0iuXT40lDLyvovqILjDYqVpuBIU6sSSg/Wa5eoJd6y04I11mWu4BYiPBe
 kLfuQpNopRUOROCdrRraoi8D8Ary6nIFtn/UP3QKN1UbfBZbg6M/Ch0aQiQ0mbhnVI3lqcXP
 ZadeNyrS3EABsxP1Dq3Q+IR+bsqwCkkwiXUX5+T5x692rqDb32HYb4CNB2FaeVRxKqcrR/c6
 dp3K8qAwBIZW+r7ChQ76qZKcwpMdyJiQ8mr9YoOLLXrzhda9H8JFtDKx6k+YNZfg+dtqMDU9
 GG4RWZFxw+q7ZHYEjlmekyPeZu2A8ku/CJrYXB8Vbq78yN9ONjytc/zY7NyJOB6r7I7kJaYW
 tFfI6297uJzpiMrEtj3Rb30t8RceRuinmpi1AL1MWFkL/aMq+Ekk+IInzcDFwFUVEJbTeNk/
 9WdOvrzGPLvvThKAsfMc+6IxFisp3Ubk+8adxKWcoEKIRmyr9Y6dXKZYhoLzyckc02rKtyyi
 W6r7eow/7GR8+fZDvGS7Ux7k2tZO7QnRRcLd4Uqxb23KTPb7gKe/GO0a87RJWq1fDqtqM2fi
 RB9k6mU3AsvwAwb7OKR0t9DkcoD2jcYj+UAkFw8QS6TMArD53EJCiDu4PSjf5Zlntdx0TZak
 GrWkjWGEd1l4P/YLWM=
IronPort-HdrOrdr: A9a23:FSnW4aMx2+eR7cBcTh2jsMiBIKoaSvp037BL7TELdfUxSKelfq
 +V8sjzuSWYtN9TYgBFpTn4Asi9qCrnlaKdgrNhX4tKPjOWwFdARbsKheHfKlvbakjDH4Vmup
 uIHZITNDS+NykcsS9W2njfL/8whPO82OSDg+PGyndkSgtnL5tn8xxyBm+gYy5LrU19dOMEKK
 Y=
X-IronPort-AV: E=Sophos;i="5.98,303,1673931600"; d="scan'208";a="103042006"
Date: Thu, 30 Mar 2023 14:05:00 +0100
To: Bernhard Beschow <shentey@gmail.com>
CC: <qemu-devel@nongnu.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Woodhouse <dwmw@amazon.co.uk>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>, Aurelien Jarno
 <aurelien@aurel32.net>, Eduardo Habkost <eduardo@habkost.net>, Paul Durrant
 <paul@xen.org>, <xen-devel@lists.xenproject.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Richard
 Henderson <richard.henderson@linaro.org>, Philippe
 =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Chuck Zmudzinski
 <brchuckz@aol.com>
Subject: Re: [PATCH v3 5/6] hw/isa/piix3: Resolve redundant k->config_write
 assignments
Message-ID: <f9953cc3-de45-4a22-98c6-e734ca1ef536@perard>
References: <20230312120221.99183-1-shentey@gmail.com>
 <20230312120221.99183-6-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230312120221.99183-6-shentey@gmail.com>
Received-SPF: pass client-ip=216.71.155.175;
 envelope-from=prvs=446aa7e4f=anthony.perard@citrix.com;
 helo=esa6.hc3370-68.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Reply-to:  Anthony PERARD <anthony.perard@citrix.com>
From:  Anthony PERARD via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, Mar 12, 2023 at 01:02:20PM +0100, Bernhard Beschow wrote:
> The previous patch unified handling of piix3_write_config() accross the
> PIIX3 device models which allows for assigning k->config_write once in the
> base class.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

