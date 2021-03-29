Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFDA34D68E
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 20:04:23 +0200 (CEST)
Received: from localhost ([::1]:57762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQwFS-0008WP-KL
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 14:04:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lQwDC-000820-D0
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 14:02:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lQwD7-0002rV-V7
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 14:02:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617040915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DA7o3BP44BGuqVAT1gLVbR5OhzyvrT/WCX3WPhvOGYQ=;
 b=JGUnbHVzHx7aTj5nIh+YZIYIIclIydnH8zFvzdA7c9k06fXQigzhUsNO0bEJ8/OtnB8iv5
 hBrZfM3tdmCXb8vfVXV8jxiwt0OMPRewhr0tvZECe6H9Embpehh3J6IQ9l2Xl5vmjcHDuF
 +Hf+KDOPXJcS8oig1yEVhlvo1i3hO8Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-OlKM6jXoP4WNcj_e2OaRww-1; Mon, 29 Mar 2021 14:01:51 -0400
X-MC-Unique: OlKM6jXoP4WNcj_e2OaRww-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAE851005D4F;
 Mon, 29 Mar 2021 18:01:49 +0000 (UTC)
Received: from thuth.com (ovpn-112-129.ams2.redhat.com [10.36.112.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 54EC110016FD;
 Mon, 29 Mar 2021 18:01:42 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] docs: Add a QEMU Code of Conduct and Conflict Resolution
 Policy document
Date: Mon, 29 Mar 2021 20:01:40 +0200
Message-Id: <20210329180140.2761383-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In an ideal world, we would all get along together very well, always be
polite and never end up in huge conflicts. And even if there are conflicts,
we would always handle each other fair and respectfully. Unfortunately,
this is not an ideal world and sometimes people forget how to interact with
each other in a professional and respectful way. Fortunately, this rarely
happens in the QEMU community, but still there are such rare cases, and
then it would be good to have a basic code of conduct document available
that can be shown to persons who are misbehaving. And if that does not help
yet, we should also have a conflict resolution policy ready that can be
applied in the worst case.

The Code of Conduct document is based on the Django Code of Conduct
(https://www.djangoproject.com/conduct/) and the conflict resolution
has been assembled by Paolo, based on the Drupal Conflict Resolution Policy
(https://www.drupal.org/conflict-resolution) and the Mozilla Consequence Ladder
(https://github.com/mozilla/diversity/blob/master/code-of-conduct-enforcement/consequence-ladder.md)

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Discussion about a Code of Conduct already started off-list last summer,
 but it unfortunately ceased without a result. Let's have another try
 now by discussing this suggestion publically. I've picked the Django Code
 of Conduct as a base, since it sounds rather friendly and still welcoming
 to me, but I'm open for other suggestions, too.

 docs/devel/code-of-conduct.rst     | 85 ++++++++++++++++++++++++++++++
 docs/devel/conflict-resolution.rst | 85 ++++++++++++++++++++++++++++++
 docs/devel/index.rst               |  2 +
 3 files changed, 172 insertions(+)
 create mode 100644 docs/devel/code-of-conduct.rst
 create mode 100644 docs/devel/conflict-resolution.rst

diff --git a/docs/devel/code-of-conduct.rst b/docs/devel/code-of-conduct.rst
new file mode 100644
index 0000000000..050dbd9e16
--- /dev/null
+++ b/docs/devel/code-of-conduct.rst
@@ -0,0 +1,85 @@
+Code of Conduct
+===============
+
+Like the technical community as a whole, the QEMU community is made up of a
+mixture of professionals and volunteers from all over the world.
+Diversity is one of our huge strengths, but it can also lead to communication
+issues and unhappiness. To that end, we have a few ground rules that we ask
+people to adhere to. This code applies equally to founders, maintainers,
+contributors, mentors and those seeking help and guidance.
+
+This isn't an exhaustive list of things that you can't do. Rather, take it in
+the spirit in which it's intended - a guide to make it easier to enrich all of
+us and the technical communities in which we participate:
+
+* Be friendly and patient.
+
+* Be welcoming. We strive to be a community that welcomes and supports people
+  of all backgrounds and identities. This includes, but is not limited to
+  members of any race, ethnicity, culture, national origin, colour, immigration
+  status, social and economic class, educational level, sex, sexual orientation,
+  gender identity and expression, age, size, family status, political belief,
+  religion, and mental and physical ability.
+
+* Be considerate. Your work will be used by other people, and you in turn will
+  depend on the work of others. Any decision you take will affect users and
+  colleagues, and you should take those consequences into account when making
+  decisions. Remember that we're a world-wide community, so you might not be
+  communicating in someone else's primary language.
+
+* Be respectful. Not all of us will agree all the time, but disagreement is no
+  excuse for poor behavior and poor manners. We might all experience some
+  frustration now and then, but we cannot allow that frustration to turn into
+  a personal attack. It's important to remember that a community where people
+  feel uncomfortable or threatened is not a productive one. Members of the QEMU
+  community should be respectful when dealing with other members as well as
+  with people outside the QEMU community.
+
+* Be careful in the words that you choose. We are a community of professionals,
+  and we conduct ourselves professionally. Be kind to others. Do not insult or
+  put down other participants. Harassment and other exclusionary behavior
+  aren't acceptable. This includes, but is not limited to:
+
+  * Violent threats or language directed against another person.
+
+  * Discriminatory jokes and language.
+
+  * Posting sexually explicit or violent material.
+
+  * Posting (or threatening to post) other people's personally identifying
+    information ("doxing").
+
+  * Personal insults, especially those using racist or sexist terms.
+
+  * Unwelcome sexual attention.
+
+  * Advocating for, or encouraging, any of the above behavior.
+
+  * Repeated harassment of others. In general, if someone asks you to stop,
+    then stop.
+
+* When we disagree, try to understand why. Disagreements, both social and
+  technical, happen all the time and our project is no exception. It is
+  important that we resolve disagreements and differing views constructively.
+  Remember that we're different. The strength of our project comes from its
+  varied community, people from a wide range of backgrounds. Different people
+  have different perspectives on issues. Being unable to understand why someone
+  holds a viewpoint doesn't mean that they're wrong. Don't forget that it is
+  human to err and blaming each other doesn't get us anywhere. Instead, focus
+  on helping to resolve issues and learning from mistakes.
+
+This code of conduct applies to all spaces managed by the QEMU project. This
+includes IRC, the mailing lists, the issue tracker, community events, and any
+other forums created by the project team which the community uses for
+communication. In addition, violations of this code outside these spaces may
+affect a person's ability to participate within them.
+
+If you believe someone is violating the code of conduct, please read the
+:ref:`conflict-resolution` document for information about how to proceed.
+
+This document is based on the `Django Code of Conduct
+<https://www.djangoproject.com/conduct/>`__, with original text courtesy of the
+`Speak Up! project
+<http://web.archive.org/web/20141109123859/http://speakup.io/coc.html>`__
+(`CC BY 3.0 <https://creativecommons.org/licenses/by/3.0/>`__).
+
diff --git a/docs/devel/conflict-resolution.rst b/docs/devel/conflict-resolution.rst
new file mode 100644
index 0000000000..4eb4fb45df
--- /dev/null
+++ b/docs/devel/conflict-resolution.rst
@@ -0,0 +1,85 @@
+.. _conflict-resolution:
+
+Conflict Resolution Policy
+==========================
+
+Conflicts in the community can take many forms, from someone having a
+bad day and using harsh and hurtful language on the mailing list to more
+serious code of conduct violations (including sexist/racist statements
+or threats of violence), and everything in between.
+
+For the vast majority of issues, we aim to empower individuals to first
+resolve conflicts themselves, asking for help when needed, and only
+after that fails to escalate further. This approach gives people more
+control over the outcome of their dispute.
+
+How we resolve conflicts
+------------------------
+
+If you are experiencing conflict, you should first address the perceived
+conflict directly with other involved parties, preferably through a
+real-time medium such as IRC. If this fails, get a third-party (e.g. a
+mutual friend, and/or someone with background on the issue, but not
+involved in the conflict) to intercede or mediate.
+
+If you are witnessing conflict, you should also first try to address it
+directly by interceding or mediating between the involved parties.
+
+If a good faith effort towards resolving the conflict fails,
+escalate to the QEMU leadership committee by sending email at
+qemu@sfconservancy.org. It is strongly suggested to include evidence of
+past effort towards resolving the conflict.
+
+The QEMU leadership committee will do its best to review the incident
+timely, and will either seek further information, or will make a
+determination on next steps.
+
+Note: If the behaviour is threatening/harassing and requires immediate
+escalation, contact the QEMU leadership committee immediately before
+trying other steps, and possibly inform one or more members through IRC.
+The up-to-date list of members is `available on the QEMU wiki
+<https://wiki.qemu.org/Conservancy>`__.
+
+Remedies
+--------
+
+Escalating an issue to the QEMU leadership committee may result in actions
+impacting one or more involved parties. In the event the leadership
+committee has to intervene, here are some of the ways they might respond:
+
+1. Take no action. For example, if the leadership committee determines
+the complaint has not been substantiated or is being made in bad faith,
+or if it is deemed to be outside its purview.
+
+2. A private reprimand, explaining the consequences of continued behavior,
+to one or more involved individuals.
+
+3. A private reprimand and request for a private or public apology
+
+4. A public reprimand and request for a public apology
+
+5. A public reprimand plus a mandatory cooling off period. The cooling
+off period may require, for example, one or more of the following:
+abstaining from maintainer duties; not interacting with people involved,
+including unsolicited interaction with those enforcing the guidelines
+and interaction on social media; being denied participation to in-person
+events.  The cooling off period is voluntary but may escalate to a
+temporary ban in order to enforce it.
+
+6. A permanent or temporary ban from some or all QEMU spaces (mailing
+lists, IRC, wiki, etc.). The group will maintain records of all such
+bans so that they may be reviewed in the future, extended to new fora,
+or otherwise maintained.
+
+In the event of severe harassment, the leadership comittee may advise that
+the matter be escalated to the relevant local law enforcement agency. It
+is however not the role of the leadership comittee to initiate contact
+with law enforcement on behalf of any of the community members involved
+in an incident.
+
+Sources
+-------
+
+* `Drupal Conflict Resolution Policy and Process <https://www.drupal.org/conflict-resolution>`__
+
+* `Mozilla Consequence Ladder <https://github.com/mozilla/diversity/blob/master/code-of-conduct-enforcement/consequence-ladder.md>`__
diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index 7c424ea6d7..416261505f 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -14,6 +14,8 @@ Contents:
    :maxdepth: 2
    :includehidden:
 
+   code-of-conduct
+   conflict-resolution
    build-system
    style
    kconfig
-- 
2.27.0


