Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60723366D73
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 16:00:23 +0200 (CEST)
Received: from localhost ([::1]:60536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZDOw-0007vJ-GZ
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 10:00:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lZDNs-0007V5-Q2
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 09:59:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lZDNq-0004ef-TA
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 09:59:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619013554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EtMQytQrpzatcPWRB2AeYsh/0/RvNgRnn1uyy1whi9Y=;
 b=SvfdCzwbcSYInRnEIrGn26752Y/tTwLr3HiOwXcfmb2j6qNYrLpxexeOkA9YCC/ofto++q
 ZY7m3X3frz2R9ucXYPObSc2+SeOJICNKYb6U+5DC/646Hk99rUPv/4mghg3EneKqC44XN6
 vpmU5ocjRjvpBpH1Ovu0s1c4ldbsY+U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-UZ6kpSwgMRiYLf1fAuMDBA-1; Wed, 21 Apr 2021 09:58:36 -0400
X-MC-Unique: UZ6kpSwgMRiYLf1fAuMDBA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C88B109781D;
 Wed, 21 Apr 2021 13:58:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EEE3B6085A;
 Wed, 21 Apr 2021 13:58:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 84C8B113525D; Wed, 21 Apr 2021 15:58:33 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 16/19] qapi/expr.py: Add docstrings
References: <20210325060356.4040114-1-jsnow@redhat.com>
 <20210325060356.4040114-17-jsnow@redhat.com>
 <871rbckiuf.fsf@dusky.pond.sub.org>
 <f958a02d-7c14-f6ee-4337-fc85ef567ee5@redhat.com>
 <878s5hyrqa.fsf@dusky.pond.sub.org>
 <6778db51-f0da-a4cd-079d-b577954acb75@redhat.com>
Date: Wed, 21 Apr 2021 15:58:33 +0200
In-Reply-To: <6778db51-f0da-a4cd-079d-b577954acb75@redhat.com> (John Snow's
 message of "Tue, 20 Apr 2021 21:27:52 -0400")
Message-ID: <87y2db20za.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

[...]
> I've made a re-spin. Let's try something new, if you don't mind:
>
> I've pushed a "almost v5" copy onto my gitlab, where edits made against 
> this patch are in their own commit so that all of the pending edits I've 
> made are easily visible.
>
> Here's the "merge request", which I made against my own fork of master:
> https://gitlab.com/jsnow/qemu/-/merge_requests/1/diffs
>
> (It's marked "WIP", so there's no risk of me accidentally merging it -- 
> and if I did, it would be to my own "master" branch, so no worries about 
> us goofing this up.)
>
> If you click "Commits (21)" at the top, underneath "WIP: 
> python-qapi-cleanup-pt3", you can see the list of commits in the re-spin.
>
> (Four of these commits are the DO-NOT-MERGE ones I carry around as a 
> testing pre-requisite.)
>
>  From here, you can see the "[RFC] docstring diff" patch which shows all 
> the edits I've made so far based on your feedback and my tinkering.
>
> https://gitlab.com/jsnow/qemu/-/merge_requests/1/diffs?commit_id=3f0e9fb71304edb381ce3b9bf0ff08624fb277bc
>
> I invite you to leave feedback here on this view (and anywhere else in 
> the series that still needs adjusting, if you are so willing to humor 
> me) by highlighting the line and clicking the comment box icon on the 
> left. If you left-click and drag the comment box, you can target a range 
> of lines.
>
> (You can even propose a diff directly using this method, which allows me 
> to just accept your proposal directly.)
>
> If you leave any comments here, I can resolve each individual nugget of 
> feedback by clicking "Resolve Thread" in my view, which will help me 
> keep track of which items I believe I have addressed and which items I 
> have not. This will help me make sure I don't miss any of your feedback, 
> and it helps me keep track of what edits I've made for the next changelog.
>
> Willing to try it out?
>
> Once we're both happy with it, I will send it back to the list for final 
> assessment using our traditional process. Anyone else who wants to come 
> comment on the gitlab draft is of course more than welcome to.

I have only a few minor remarks, and I'm too lazy to create a gitlab
account just for them.

* Commit 3f0e9fb713 qapi/expr: [RFC] docstring diff

  - You mixed up check_name_lower() and check_name_camel()

  - Nitpick: check_defn_name_str() has inconsistent function name
    markup.

  - I'd like to suggest a tweak of check_defn_name_str() :param meta:

  That's all.  Converged quickly.  Nice!  Incremental diff appended.

* Old "[PATCH v4 17/19] qapi/expr.py: Use tuples instead of lists for
  static data" is gone.  I think this leaves commit 913e3fd6f8's "Later
  patches will make use of that" dangling.  Let's not drop old PATCH 17.
  Put it right after 913e3fd6f8 if that's trivial.  If not, put it
  wherever it creates the least work for you.


diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index f2bb92ab79..5c9060cb1b 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -124,7 +124,7 @@ def check_name_lower(name: str, info: QAPISourceInfo, source: str,
                      permit_upper: bool = False,
                      permit_underscore: bool = False) -> None:
     """
-    Ensure that ``name`` is a valid user defined type name.
+    Ensure that ``name`` is a valid command or member name.
 
     This means it must be a valid QAPI name as checked by
     `check_name_str()`, but where the stem prohibits uppercase
@@ -147,7 +147,7 @@ def check_name_lower(name: str, info: QAPISourceInfo, source: str,
 
 def check_name_camel(name: str, info: QAPISourceInfo, source: str) -> None:
     """
-    Ensure that ``name`` is a valid command or member name.
+    Ensure that ``name`` is a valid user-defined type name.
 
     This means it must be a valid QAPI name as checked by
     `check_name_str()`, but where the stem must be in CamelCase.
@@ -168,14 +168,14 @@ def check_defn_name_str(name: str, info: QAPISourceInfo, meta: str) -> None:
     Ensure that ``name`` is a valid definition name.
 
     Based on the value of ``meta``, this means that:
-      - 'event' names adhere to `check_name_upper`.
-      - 'command' names adhere to `check_name_lower`.
+      - 'event' names adhere to `check_name_upper()`.
+      - 'command' names adhere to `check_name_lower()`.
       - Else, meta is a type, and must pass `check_name_camel()`.
         These names must not end with ``Kind`` nor ``List``.
 
     :param name: Name to check.
     :param info: QAPI schema source file information.
-    :param meta: Type name of the QAPI expression.
+    :param meta: Meta-type name of the QAPI expression.
 
     :raise QAPISemError: When ``name`` fails validation.
     """


