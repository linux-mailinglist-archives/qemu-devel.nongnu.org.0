Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C314CDB3A
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 18:46:17 +0100 (CET)
Received: from localhost ([::1]:54540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQC0N-0002uJ-I2
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 12:46:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQBF5-0005u2-PX
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:57:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQBF3-00061a-QO
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:57:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646413041;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=h0MVtJ4cI6ODUPNo2G+bpD1UaPWbxqAmbe3NbhE0aFk=;
 b=U7t1x88GOFqOWyc9tTc38cllhkxyKNuFbmGmfVf9MjghB/HLOeZg8K8rnbLx8BG/m2UgOo
 dTIpkE1fGl+PIFc4fhEfaCSEkmXQUur2fD4gpQ0RIL6uW9MqdHX1nVFq62CwOMnPrOmDw9
 vyhaFVy/lyKnNfn5EroM5ewloZHdDcA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-FWtz8rWBN-6DBCNk_Z_PXQ-1; Fri, 04 Mar 2022 11:57:15 -0500
X-MC-Unique: FWtz8rWBN-6DBCNk_Z_PXQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C33A801DDC;
 Fri,  4 Mar 2022 16:57:14 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4379D106F74C;
 Fri,  4 Mar 2022 16:57:13 +0000 (UTC)
Date: Fri, 4 Mar 2022 16:57:10 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] Revert "check-block: replace -makecheck with TAP output"
Message-ID: <YiJE5n8CkFTX4Zqn@redhat.com>
References: <20220208124432.84924-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220208124432.84924-1-pbonzini@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, thuth@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 08, 2022 at 07:44:32AM -0500, Paolo Bonzini wrote:
> This reverts commit d316859f4e28c74ab8b618895d2a5e0a865d3cf1.  The
> TAP output is inferior in that it does not include the diff for
> failed tests.
> 
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  tests/check-block.sh             |  6 ++--
>  tests/qemu-iotests/check         |  6 ++--
>  tests/qemu-iotests/meson.build   |  1 -
>  tests/qemu-iotests/testenv.py    | 30 +++++++++----------
>  tests/qemu-iotests/testrunner.py | 49 +++++++++++++++-----------------
>  5 files changed, 44 insertions(+), 48 deletions(-)

Peter mentioned that he's seeing the CentOS 8 CI job fail
continuously: eg

https://gitlab.com/qemu-project/qemu/-/jobs/2163919781

[quote]
1/1 qemu:block / qemu-iotests qcow2 ERROR          163.04s   120 subtests passed
Summary of Failures:
1/1 qemu:block / qemu-iotests qcow2 ERROR          163.04s   120 subtests passed
Ok:                 0   
Expected Fail:      0   
Fail:               1   
Unexpected Pass:    0   
Skipped:            0   
Timeout:            0   
Full log written to /home/gitlab-runner/builds/Jpwtyaz7/0/qemu-project/qemu/build/meson-logs/iotestslog.txt
make: *** [/home/gitlab-runner/builds/Jpwtyaz7/0/qemu-project/qemu/tests/Makefile.include:156: check-block] Error 1

[/quote]

None of the individual tests are showing ERROR though, only the final
status is error.

We also don't have access to iotestslog.txt which is very annoying.

When i run it locally I got the iotests.log and found that it
contained an error message saying the TAP outout was malformed
and couldn't be parsed.

When I ran the iotests manually I confirmed this, it prints:

ok qcow2 037
ok qcow2 038
ok qcow2 039
ok qcow2 040
ok qcow2 041
    [case not run] test_after_a_quorum_snapshot (__main__.TestRepairQuorum): formats ['quorum'] are not whitelisted
    [case not run] test_cancel (__main__.TestRepairQuorum): formats ['quorum'] are not whitelisted
    [case not run] test_cancel_after_ready (__main__.TestRepairQuorum): formats ['quorum'] are not whitelisted
    [case not run] test_complete (__main__.TestRepairQuorum): formats ['quorum'] are not whitelisted
    [case not run] test_device_not_found (__main__.TestRepairQuorum): formats ['quorum'] are not whitelisted
    [case not run] test_image_not_found (__main__.TestRepairQuorum): formats ['quorum'] are not whitelisted
    [case not run] test_medium_not_found (__main__.TestRepairQuorum): formats ['quorum'] are not whitelisted
    [case not run] test_no_node_name (__main__.TestRepairQuorum): formats ['quorum'] are not whitelisted
    [case not run] test_nonexistent_replaces (__main__.TestRepairQuorum): formats ['quorum'] are not whitelisted
    [case not run] test_pause (__main__.TestRepairQuorum): formats ['quorum'] are not whitelisted
    [case not run] test_with_other_parent (__main__.TestRepairQuorum): formats ['quorum'] are not whitelisted
    [case not run] test_with_other_parents_after_mirror_start (__main__.TestRepairQuorum): formats ['quorum'] are not whitelisted
    [case not run] test_wrong_sync_mode (__main__.TestRepairQuorum): formats ['quorum'] are not whitelisted

ok qcow2 042
ok qcow2 043
ok qcow2 046


All those '[case not run]' lines are invalid tap output.  The
need to start with a leading '#' to be treated as a diagnostic
message. I briefly considered sending a patch, until I remember
this change to stop using TAP.

Anyway I'd say the commit message here needs updating. It is
not merely improving diff output. It is adressing the fact that
the I/O tests runner is not producing valid TAP output, and so
causing bogus failures.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


