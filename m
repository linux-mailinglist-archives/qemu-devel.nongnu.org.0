Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D7D307596
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 13:10:47 +0100 (CET)
Received: from localhost ([::1]:47992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l568M-0007ZK-FY
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 07:10:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l55po-0006n9-0Q
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:51:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l55pm-0000kn-0J
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:51:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611834692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f22jj3YPVZG+IztqN4cOFj56ja3VFFCZhDNNjdI/bII=;
 b=E5Xcy+0BisakAA1pNa3+G4qezt8RX3GTVmEEy/kZnRuYoXuOFJOivuEPj6QdRXS6KCG3jz
 gLl/FOZGNtySznpLVhn5uohmFuBzNDwaIA3pm8s6ppdFsVJehCF/b84tnoKaJ1HMzy9GC2
 L6o2rp2Lfo5fJ5TLoMbe1n+NgNHF3MM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-jbo2cHsXNzq7ffNMfiqXnQ-1; Thu, 28 Jan 2021 06:51:29 -0500
X-MC-Unique: jbo2cHsXNzq7ffNMfiqXnQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7E7D8030A1;
 Thu, 28 Jan 2021 11:51:27 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-110.ams2.redhat.com [10.36.112.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AFE69100239A;
 Thu, 28 Jan 2021 11:51:21 +0000 (UTC)
Subject: Re: [PATCH v4 0/4] GitLab Custom Runners and Jobs (was: QEMU Gating
 CI)
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20201019015003.1527746-1-crosa@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <e253800c-815c-d561-1fd7-ac9b581c5b2b@redhat.com>
Date: Thu, 28 Jan 2021 12:51:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20201019015003.1527746-1-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Andrea Bolognani <abologna@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/10/2020 03.49, Cleber Rosa wrote:
> TL;DR: this should allow the QEMU maintainer to push to the staging
> branch, and have custom jobs running on the project's aarch64 and
> s390x machines.  Simple usage looks like:
> 
>     git push remote staging
>     ./scripts/ci/gitlab-pipeline-status --verbose --wait

  Hi Cleber,

since the QEMU project is now using the gitlab repo as main repository, it 
should now be possible to finally enable these custom runners, too, I think.

Could you elaborate on what's left to do to get the s390x and aarch64 
runners enabled, and rebase your patches if necessary?

  Thanks,
   Thomas


