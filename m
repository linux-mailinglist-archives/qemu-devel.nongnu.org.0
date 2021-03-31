Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A8C34FCE5
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 11:33:21 +0200 (CEST)
Received: from localhost ([::1]:40642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRXE1-00029X-15
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 05:33:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1lRXCR-0001in-44
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 05:31:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1lRXCM-0006RM-AR
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 05:31:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617183094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XXC7aRKeq8vNELi3xIhYZq6YdASR6wh1w9hQ5RAB/lI=;
 b=GEUutfoPqDR5lefVvhN+d30JIdnfnxsJURiGq5XiZnEeyHdR2ZBUmEY4nV4sxxesiX8YFh
 kIHVj42MlBa0CdwIhqzHRLp69P05Fa0SA1bRipNQT4OXCNkWpB83jKW9TbO00bCOsYjQIg
 sxpDhxVhueuoY3v4Mgouuwn67+YjePQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-7Y9bpUnrNlay2K_f_Sz1cA-1; Wed, 31 Mar 2021 05:31:30 -0400
X-MC-Unique: 7Y9bpUnrNlay2K_f_Sz1cA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 744AE501FE;
 Wed, 31 Mar 2021 09:31:29 +0000 (UTC)
Received: from harajuku.usersys.redhat.com (unknown [10.40.194.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B69D92C31A;
 Wed, 31 Mar 2021 09:31:18 +0000 (UTC)
Message-ID: <60993d6dd3e51e18139658f01734e83dfcea5425.camel@redhat.com>
Subject: Re: Serious doubts about Gitlab CI
From: Andrea Bolognani <abologna@redhat.com>
To: Thomas Huth <thuth@redhat.com>, "Daniel P." =?ISO-8859-1?Q?Berrang=E9?=
 <berrange@redhat.com>
Date: Wed, 31 Mar 2021 11:31:16 +0200
In-Reply-To: <9b643ebc-096d-076e-5d53-edceca79f0f0@redhat.com>
References: <YFOt+R77HfpNEYFc@stefanha-x1.localdomain>
 <2d1e40c6-5fa4-271f-5ecc-74da7c04ffea@redhat.com>
 <YFRv9zMvBXtpfN3t@stefanha-x1.localdomain>
 <20210319101848.ebdwkfttay73jajr@kamzik.brq.redhat.com>
 <cad173cb-7715-1286-eba2-75e9816e6177@redhat.com>
 <b351f107-a9fd-f7cf-1f27-2d435cea612a@amsat.org>
 <d05a40b2-ff80-d9c8-8dfe-5dfce2e57d3d@redhat.com>
 <YGHf3HjYTRJwktbf@stefanha-x1.localdomain> <YGMJSoIGa5VoVDB1@redhat.com>
 <04e5e251-7a09-dcf6-82ad-31bf696bc248@redhat.com>
 <YGMlR9gXwPqLdhr0@redhat.com>
 <9b643ebc-096d-076e-5d53-edceca79f0f0@redhat.com>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=abologna@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2021-03-31 at 09:54 +0200, Thomas Huth wrote:
> On 30/03/2021 15.19, Daniel P. Berrangé wrote:
> > Yep, that looks similar to what we do in libvirt, though we don't override
> > the compiler at the job level. Instead we just ensure the dir containing
> > ccache symlinks appears first in $PATH.
> 
> That's of course a nice idea, too, but it does not seem to work with the 
> clang builds:
> 
> https://gitlab.com/thuth/libvirt/-/jobs/1142239591#L3780
> https://gitlab.com/thuth/libvirt/-/jobs/1142239581#L3738

That's because the corresponding Dockerfile doesn't contain
instructions to create a symlink for clang:

  https://gitlab.com/libvirt/libvirt/-/blob/master/ci/containers/fedora-rawhide.Dockerfile#L105-107

It's simply a bug in lcitool that needs to be addressed.

-- 
Andrea Bolognani / Red Hat / Virtualization


