Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 162592FE736
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 11:11:49 +0100 (CET)
Received: from localhost ([::1]:38232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2WwO-0007vt-23
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 05:11:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l2WtO-0005vo-9c
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 05:08:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l2WtM-0004KQ-6w
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 05:08:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611223718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ipaiMlnV8B6su2mj50uMJTiSoeykvKBSkzQtJpKa2w8=;
 b=QHf44kWpYWBEmk8JUnywEcEQkhydYQ0TAbYSpicCG3QoQ9s/raraJPNJ6TjL2yFAyWOp34
 spyr66n51SnPGXcMrNUdGwrjpniZ2SZO+GyeO1bZfiaJWk1aEwsLqD23N6lfXm9G+9xiW9
 5X9MvXmqxxpkVl68jAlrscyo8Tf1Ml8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-eN4hh7R3OOy2vkHAHTXaJQ-1; Thu, 21 Jan 2021 05:08:37 -0500
X-MC-Unique: eN4hh7R3OOy2vkHAHTXaJQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93DB8801817;
 Thu, 21 Jan 2021 10:08:35 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-82.ams2.redhat.com [10.36.112.82])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B2FC6268F;
 Thu, 21 Jan 2021 10:08:30 +0000 (UTC)
Subject: Re: [RFC PATCH 2/2] gitlab-ci: Add a job building TCI with Clang
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210110162739.858087-1-f4bug@amsat.org>
 <20210110162739.858087-3-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <78a9718b-dec0-cc31-7ada-e815d9022e65@redhat.com>
Date: Thu, 21 Jan 2021 11:08:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210110162739.858087-3-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Stefan Weil <sw@weilnetz.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Wataru Ashihara <wataash@wataash.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/01/2021 17.27, Philippe Mathieu-Daudé wrote:
> Split the current GCC build-tci job in 2, and use Clang
> compiler in the new job.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> RFC in case someone have better idea to optimize can respin this patch.
> 
>   .gitlab-ci.yml | 22 ++++++++++++++++++++--
>   1 file changed, 20 insertions(+), 2 deletions(-)

I'm not quite sure whether we should go down this road ... if we wanted to 
have full test coverage for clang, we'd need to duplicate *all* jobs to run 
them once with gcc and once with clang. And that would be just overkill.

I think we already catch most clang-related problems with the clang jobs 
that we already have in our CI, so problems like the ones that you've tried 
to address here should be very, very rare. So I'd rather vote for not 
splitting the job here.

  Thomas


