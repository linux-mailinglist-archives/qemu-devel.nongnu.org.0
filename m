Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B82DB2AAA24
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Nov 2020 09:59:02 +0100 (CET)
Received: from localhost ([::1]:40044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kbgXN-0007QK-Rv
	for lists+qemu-devel@lfdr.de; Sun, 08 Nov 2020 03:59:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kbgWO-0006vX-MS
 for qemu-devel@nongnu.org; Sun, 08 Nov 2020 03:58:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kbgWN-0001yx-2K
 for qemu-devel@nongnu.org; Sun, 08 Nov 2020 03:58:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604825878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8/vR7GTz1pn44kp++5dv3uhWt4yLp3AmzmlG7yi4kQk=;
 b=OeOGNKkyncJQOUuKqsjUXzw4grVP3YD2YaJcJ2fSoyUWacm/NTLoNVDsNlnafvkvk9OjLi
 8Ux1dm0Hq8KO9sW57aDOFiMN//kk0yfeekGl/PB/h0q0GZKTJcs0sZw8Js7paH1c/g+B42
 TY79Xfofkx90QQ9z1lJnSYWxDeOLNnM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-EQxEkmPwPI2pnmy0tlMdQA-1; Sun, 08 Nov 2020 03:57:55 -0500
X-MC-Unique: EQxEkmPwPI2pnmy0tlMdQA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CD1D107B470;
 Sun,  8 Nov 2020 08:57:54 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-53.ams2.redhat.com [10.36.112.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 445125D9F1;
 Sun,  8 Nov 2020 08:57:52 +0000 (UTC)
Subject: Re: Migrating to the gitlab issue tracker
To: John Snow <jsnow@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <bda4f471-8ed6-3832-29ac-279a6d3bb7cc@redhat.com>
 <20201029174114.47e2b351.cohuck@redhat.com>
 <CAKmqyKOY+5WcxUg3Rvq2t3vYWOHrHQdhcv8PkiqZX2zVMdqJ3Q@mail.gmail.com>
 <3713093e-bf3b-bf23-a8d0-70fe429032ba@redhat.com>
 <c7308133-cf29-8668-f781-6d025eb16722@redhat.com>
 <3d9b264a-5e1f-b936-8455-bafc6b89ebe5@redhat.com> <87v9esko1i.fsf@linaro.org>
 <42ff3b6a-c51b-23fb-68e4-3a4b8a3a2cea@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <08d300c1-6cb1-f068-14eb-dcaaacdc478d@redhat.com>
Date: Sun, 8 Nov 2020 09:57:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <42ff3b6a-c51b-23fb-68e4-3a4b8a3a2cea@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/08 01:02:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/10/2020 13.53, John Snow wrote:
> On 10/30/20 6:26 AM, Alex Bennée wrote:
>> Can we extract data as a CSV from Launchpad?
> 
> Not sure, I don't have maintainer access there. Thomas?

I've never seen such an option. But (as you've already discovered) there is
an API for Launchpad which can be used for retrieving information about
bugs. I'm using it for my QEMU bug dashboard here:

 http://people.redhat.com/~thuth/qemu/bugs-dashboard.html

FWIW, sources can be found here:

 https://github.com/huth/openstack/tree/qemu

 Thomas


