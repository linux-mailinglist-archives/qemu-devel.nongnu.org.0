Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB322774DD
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Sep 2020 17:09:37 +0200 (CEST)
Received: from localhost ([::1]:59214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLSsK-0001N1-3Z
	for lists+qemu-devel@lfdr.de; Thu, 24 Sep 2020 11:09:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kLSpg-0008Jc-EP
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 11:06:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kLSpb-00022m-7d
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 11:06:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600960006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=He9b6BH8R0vke3PiA7QDvqchwsHvwfv1xuocdtRlSrY=;
 b=MC1+ZMtOK7blLELXlYuEb4a43To3y0bhQ1fVmKZ14aaPnXjdhNWGBugDRCBoGUYIwZq8f7
 xa2yHOe8OHq/Bb+RoPiboEejCMgnyPrENOsFIlNM9/YvPpNAtzUGD86r2bb+hbupJsoYyk
 glhcaf0u4f5JVHZzTZ9CFL3F7yAC5bA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-aQr5i6kQPR-3v336l6B59A-1; Thu, 24 Sep 2020 11:06:44 -0400
X-MC-Unique: aQr5i6kQPR-3v336l6B59A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CA7D802B4A;
 Thu, 24 Sep 2020 15:06:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-70.ams2.redhat.com
 [10.36.112.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CBF3B19652;
 Thu, 24 Sep 2020 15:06:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6035E113865F; Thu, 24 Sep 2020 17:06:41 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 14/37] qapi/common.py: Move comments into docstrings
References: <20200915224027.2529813-1-jsnow@redhat.com>
 <20200915224027.2529813-15-jsnow@redhat.com>
 <87d02kpizr.fsf@dusky.pond.sub.org>
 <49e28f59-012c-9b7b-02b7-1854f85884b2@redhat.com>
 <20200917191455.GX7594@habkost.net>
 <3b1ce70b-377d-144f-9331-4f6da4c93f6f@redhat.com>
Date: Thu, 24 Sep 2020 17:06:41 +0200
In-Reply-To: <3b1ce70b-377d-144f-9331-4f6da4c93f6f@redhat.com> (John Snow's
 message of "Thu, 17 Sep 2020 15:31:46 -0400")
Message-ID: <87a6xf8b9a.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/24 01:10:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 9/17/20 3:14 PM, Eduardo Habkost wrote:
>> On Thu, Sep 17, 2020 at 02:44:53PM -0400, John Snow wrote:
>> [...]
>>> Having said this, I have not found any tool to date that actually *checks*
>>> these comments for consistency. The pycharm IDE interactively highlights
>>> them when it senses that you have made a mistake, but that cannot be worked
>>> into our CI process that I know of - it's a proprietary checker.
>>>
>>> So right now, they're just plaintext that I am writing to approximate the
>>> Sphinx style until such time as I enable autodoc for the module and
>>> fine-tune the actual formatting and so on.

You are deliberately trying to "approximate" Sphinx style, and ...

>> After applying this series, I only had to make two small tweaks
>> to make Sphinx + autodoc happy with the docstrings you wrote.
>> With the following patch, "make sphinxdocs" will generate the
>> QAPI Python module documentation at docs/devel/qapi.html.
>> I had to explicitly skip qapi/doc.py because autodoc thinks the
>> string constants are documentation strings.
>> 
>
> Awesome!

... actually almost nail it.

Please mention your choice of style in the commit message.

> I think I am going to delay explicitly pursuing writing a manual for
> the QAPI parser for now, but it's good to know I am not too far
> off. I'm going to target the mypy conversions first, because they can
> be invasive and full of churn.
>
> When I get there, though ... I am thinking I should add this as
> Devel/QAPI Parser.

Doing "actually Sphinx style" instead of "an approximation of Sphinx
style" would reduce churn later on.  So, if it's not too distracting...


