Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C7536BBFF
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 01:16:02 +0200 (CEST)
Received: from localhost ([::1]:39060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbASP-0000GU-3h
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 19:16:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lbARA-0008HA-St
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 19:14:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lbAR7-0001fV-2I
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 19:14:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619478878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1zfHJZ/ag0MiXfHmtsHyRL56h3OjHr6BHSJt/7RmSOg=;
 b=c51Js7e8p5AYndHEayMmBtUcBCTteVXTOikS6xM08snrdPn5cYtlH5u9HHqMZL/e8uiEaL
 BPMOcQK7TYsuHO/XqOjoaZMD+JQUSDCfLIaMAfm9ONqmIWjir4mcO+jSOGbE92fu5kYO6r
 YdofokT+dbLvJtxyRyqILJN7uzSBAb0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-Yfr9aC0LOA-pUoEbCndBWQ-1; Mon, 26 Apr 2021 19:14:36 -0400
X-MC-Unique: Yfr9aC0LOA-pUoEbCndBWQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5FE97343A4;
 Mon, 26 Apr 2021 23:14:35 +0000 (UTC)
Received: from [10.10.112.236] (ovpn-112-236.rdu2.redhat.com [10.10.112.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A9BDB5C255;
 Mon, 26 Apr 2021 23:14:34 +0000 (UTC)
Subject: Re: [PATCH 03/22] qapi/source: Remove line number from QAPISourceInfo
 initializer
To: Markus Armbruster <armbru@redhat.com>
References: <20210422030720.3685766-1-jsnow@redhat.com>
 <20210422030720.3685766-4-jsnow@redhat.com>
 <87o8e49oha.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <c6636089-02a4-97e2-5828-04bb94f6bb3b@redhat.com>
Date: Mon, 26 Apr 2021 19:14:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87o8e49oha.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/24/21 2:38 AM, Markus Armbruster wrote:
> Mixing f-string and % interpolation.  I doubt we'd write it this way
> from scratch.  I recommend to either stick to % for now (leave
> conversion to f-strings for later), or conver the column formatting,
> too, even though it's not related to the patch's purpose.

True. Two thoughts:

1. I don't like using % formatting because it behaves differently from 
.format() and f-strings. My overwhelming desire is to never use it for 
this reason.

Example: {foo} will call foo's __format__ method, whereas "%s" % foo 
will simply add str(foo). They are not always the same, not even for 
built-in Python objects.


2. Cleaning up the formatting here without cleaning it up everywhere is 
a great way to get the patch NACKed. You have in the past been fairly 
reluctant to "While we're here" cleanups, so I am trying to cut back on 
them.


This is why my habit for f-strings keeps trickling in: whenever I have 
to rewrite any interpolation, I reach for the one that behaves most 
idiomatically for Python 3. I am trying to balance that against churn 
that's not in the stated goals of the patch.

In this case: I'll clean the rest of the method to match; and add a note 
to the commit message that explains why. I will get around to removing 
all of the f-strings, but I want to hit the clean linter baseline first 
to help guide the testing for such a series. I regret the awkward 
transitional period.

--js


