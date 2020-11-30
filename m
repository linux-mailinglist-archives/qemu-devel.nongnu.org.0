Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2F82C89E9
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 17:50:05 +0100 (CET)
Received: from localhost ([::1]:32982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjmNI-0003ce-4s
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 11:50:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <areis@redhat.com>) id 1kjmJB-0000ov-IP
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 11:45:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <areis@redhat.com>) id 1kjmJ9-0003y5-HB
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 11:45:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606754744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bZk/TRZZ5TAhoD/Q33mlOI5unCzMdQ5Sn7AdmAwkZRw=;
 b=cqCOigY5F+e8jRKHa2FDFt3D0YfLe6ZhrxLswuyAh2pmoZ4aeLaAHLkfyeFv+tuY9Pkh6T
 23+7mPjyLrqZ420T6hIzntA14TXIDQeM7yD5/M6vVlOMZLoF5XpdFfkJ4CV7wDk1/fgFX2
 CUwTuveFdF33gvcYqkJUDa6Zw36eFk4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-lJ88-JQOM7-Uo-RHAkjjnQ-1; Mon, 30 Nov 2020 11:45:42 -0500
X-MC-Unique: lJ88-JQOM7-Uo-RHAkjjnQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B15D196634B;
 Mon, 30 Nov 2020 16:45:34 +0000 (UTC)
Received: from optimus.optimusnet (ovpn-117-51.rdu2.redhat.com [10.10.117.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EDBBC9CA0;
 Mon, 30 Nov 2020 16:45:32 +0000 (UTC)
Date: Mon, 30 Nov 2020 11:45:31 -0500
From: Ademar Reis <areis@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [RFC PATCH-for-5.2] gitlab-ci: Do not automatically run Avocado
 integration tests anymore
Message-ID: <20201130164531.GA159253@optimus.optimusnet>
References: <20201127174110.1932671-1-philmd@redhat.com>
 <b08db31b-1411-6936-f737-0d6c8f98ebb8@redhat.com>
 <f32a1db5-5231-fc4d-1741-0b5ee13f618f@redhat.com>
 <9157dce0-4f5d-3f1e-ce75-3e9da9252203@redhat.com>
 <20201130103109.GD2039965@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201130103109.GD2039965@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=areis@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=areis@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, virt-ci-maint-team@redhat.com,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 30, 2020 at 10:31:09AM +0000, Daniel P. Berrangé wrote:
> On Fri, Nov 27, 2020 at 07:29:31PM +0100, Thomas Huth wrote:
> > On 27/11/2020 18.57, Philippe Mathieu-Daudé wrote:
> > > On 11/27/20 6:47 PM, Thomas Huth wrote:
> > >> On 27/11/2020 18.41, Philippe Mathieu-Daudé wrote:
> > >>> We lately realized that the Avocado framework was not designed
> > >>> to be regularly run on CI environments. Therefore, as of 5.2
> > >>> we deprecate the gitlab-ci jobs using Avocado. To not disrupt
> > >>> current users, it is possible to keep the current behavior by
> > >>> setting the QEMU_CI_INTEGRATION_JOBS_PRE_5_2_RELEASE variable
> > >>> (see [*]).
> > >>> From now on, using these jobs (or adding new tests to them)
> > >>> is strongly discouraged.
> > >>>
> > >>> Tests based on Avocado will be ported to new job schemes during
> > >>> the next releases, with better documentation and templates.
> > >>
> > >> Why should we disable the jobs by default as long as there is no replacement
> > >> available yet?
> > > 
> > > Why keep it enabled if it is failing randomly
> > 
> > We can still disable single jobs if they are not stable, but that's no
> > reason to disable all of them by default, is it?
> 
> Agreed, the jobs which are known to be broken or unreliable should
> be unconditonally disabled in QEMU as a whole. This isn't specific
> to gitlab config - the qemu build makefiles/mesonfiles should disable
> the problem tests entirely, as we don't want developers wasting time
> running them locally either if they're known to be broken/unreliable.
> 

The problem is identifying when a test is broken/unreliable. No
complex test is 100% reliable: change the environment,
(configuration, build options, platform, etc) and any test complex
enough will start to fail. I've worked in projects orders of
magnitude simpler than QEMU and that was a golden rule. Testing QEMU
is *HARD*.

Which is why I defend test-automation separated from CI:

 * Have a stable CI with tests cherry-picked by whoever is
   maintaining a particular CI runner (we shouldn't have orphan
   runners).

 * Have as many tests as possible in the git repo: maintained,
   reviewed and run (outside of a CI) by people who care about them.

I absolutely agree with you that maintainers and developers should
care and our goal should be a gating CI. The question is how to
create a strategy and a plan to get there. Forcing people to care
rarely works.

Thanks.
   - Ademar

-- 
Ademar Reis Jr
Red Hat

^[:wq!


