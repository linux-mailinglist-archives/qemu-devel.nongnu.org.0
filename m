Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC40C351474
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 13:28:19 +0200 (CEST)
Received: from localhost ([::1]:44044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRvUo-0006Ct-Ul
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 07:28:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lRvPK-0000mn-FS
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 07:22:38 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:37456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lRvPG-0006jW-DR
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 07:22:37 -0400
Received: by mail-ed1-x52b.google.com with SMTP id x21so1539513eds.4
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 04:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3a9pWuPdGLfVFIeiwv5CoEQl1efGznDAG1hoHGMlNUc=;
 b=GkimMXxkiCvnjyzReqOO9s8oQM6XrT8UQRV3nZDlayPZLLmJqh6Y32YHeHTal/hbeX
 y/rlxltEpe2ZYcb8MejyhSryFELunPttlxkYTKRw9/hgrs+YX7JqyITTKKGPmPug3/UG
 9g2lVOMXtNU7OdBb9+q/E/GAdfaneCNxx3jINZNeMRvtFdoZm1ALns2BZTYdWJzCu0s1
 jbd4/SdlyOfLOaZNHyEUtA4LasJOC97+5p03NxB8+ajQyxmYEuF1Ob7nDu9kQTAnFIt+
 KjgOKjc90+Vn5nxeOyUugRuWIzOdHmlBeDK/XsEVpv88EyHTNm9f5FiFspyQ0nNDhJJe
 lfnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3a9pWuPdGLfVFIeiwv5CoEQl1efGznDAG1hoHGMlNUc=;
 b=p8WmrzVI/0kljvNegCMp8OnhqnHH87WlSnnh/cxJrn785ykGsuCgnAH8Ulil0AbPDi
 ityF+qx+nJtBN2oCHMb67av5cZ41v6wrLTQ+M5+g+xwmeNhzyqm6pgE2RwR1X7SDOMbn
 wVXjric0aH3gOiZRoCbR9U++Dmbk/SOA6Quf5HX0krVCRBavkaA1yeUcUPA2SfZL709M
 nUg0+Q2GeCgBVR5QCQKvpUGtZiNOzgC3Sr1svHmJDwhe10Ry5KDAD472c0lPE0OJvhFA
 F4v/5VppY1zVgd8pWJfEOgr8QG/EHky51Wy8/hwSv/SZwz+836X9XDsmObRIfousdaru
 ueOw==
X-Gm-Message-State: AOAM530Kv/mxSjWtucayf5dZgrlfisRWjktP127ZEb3o+RKfO8MPfY5Z
 4lbqPkN0ODWgtTWSSVnzvK8GTfTTUu0=
X-Google-Smtp-Source: ABdhPJyzII4P1Z+7y/tVkjXTSpT3sra7Yzk539Dwwu9MWq3j1Cw7xdkN8lDQx9CCOPxa7Fauap8e7Q==
X-Received: by 2002:a05:6402:2752:: with SMTP id
 z18mr9202912edd.275.1617276152943; 
 Thu, 01 Apr 2021 04:22:32 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d15sm3383516edx.62.2021.04.01.04.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 04:22:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/12] docs: Add a QEMU Code of Conduct and Conflict Resolution
 Policy document
Date: Thu,  1 Apr 2021 13:22:23 +0200
Message-Id: <20210401112223.55711-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210401112223.55711-1-pbonzini@redhat.com>
References: <20210401112223.55711-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=no autolearn_force=no
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
Cc: David Edmondson <david.edmondson@oracle.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In an ideal world, we would all get along together very well, always be
polite and never end up in huge conflicts. And even if there are conflicts,
we would always handle each other fair and respectfully. Unfortunately,
this is not an ideal world and sometimes people forget how to interact with
each other in a professional and respectful way. Fortunately, this seldom
happens in the QEMU community, but for such rare cases it is preferrable
to have a basic code of conduct document available to show to people
who are misbehaving.  In case that does not help yet, we should also have
a conflict resolution policy ready that can be applied in the worst case.

The Code of Conduct document tries to be short and to the point while
trying to remain friendly and welcoming; it is based on the Fedora Code
of Conduct[1] with extra detail added based on the Contributor Covenant
1.3.0[2].  Other proposals included the Contributor Covenant 1.3.0 itself
or the Django Code of Conduct[3] (which is also a derivative of Fedora's)
but, in any case, there was agreement on keeping the conflict resolution
policy separate from the CoC itself.

An important point is whether to apply the code of conduct to violations
that occur outside public spaces.  The text herein restricts that to
individuals acting as a representative or a member of the project or
its community.  This is intermediate between the Contributor Covenant
(which only mentions representatives of the community, for example using
an official project e-mail address or posting via an official social media
account), and the Django Code of Conduct, which says that violations of
this code outside these spaces "may" be considered but otherwise applies
no limit.

The conflict resolution policy is based on the Drupal Conflict Resolution
Policy[4] and its derivative, the Mozilla Consequence Ladder[5].

[1] https://www.fedoraproject.com/code-of-conduct/
[2] https://www.contributor-covenant.org/version/1/3/0/code-of-conduct/
[3] https://www.djangoproject.com/conduct/
[4] https://www.drupal.org/conflict-resolution
[5] https://github.com/mozilla/diversity/blob/master/code-of-conduct-enforcement/consequence-ladder.md

Co-developed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: David Edmondson <david.edmondson@oracle.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/code-of-conduct.rst     | 60 ++++++++++++++++++++++
 docs/devel/conflict-resolution.rst | 80 ++++++++++++++++++++++++++++++
 docs/devel/index.rst               |  2 +
 3 files changed, 142 insertions(+)
 create mode 100644 docs/devel/code-of-conduct.rst
 create mode 100644 docs/devel/conflict-resolution.rst

diff --git a/docs/devel/code-of-conduct.rst b/docs/devel/code-of-conduct.rst
new file mode 100644
index 0000000000..eac75ea6d9
--- /dev/null
+++ b/docs/devel/code-of-conduct.rst
@@ -0,0 +1,60 @@
+Code of Conduct
+===============
+
+The QEMU community is made up of a mixture of professionals and
+volunteers from all over the world. Diversity is one of our strengths,
+but it can also lead to communication issues and unhappiness.
+To that end, we have a few ground rules that we ask people to adhere to.
+
+* Be welcoming. We are committed to making participation in this project
+  a harassment-free experience for everyone, regardless of level of
+  experience, gender, gender identity and expression, sexual orientation,
+  disability, personal appearance, body size, race, ethnicity, age, religion,
+  or nationality.
+
+* Be respectful. Not all of us will agree all the time.  Disagreements, both
+  social and technical, happen all the time and the QEMU community is no
+  exception. When we disagree, we try to understand why.  It is important that
+  we resolve disagreements and differing views constructively.  Members of the
+  QEMU community should be respectful when dealing with other contributors as
+  well as with people outside the QEMU community and with users of QEMU.
+
+Harassment and other exclusionary behavior are not acceptable. A community
+where people feel uncomfortable or threatened is neither welcoming nor
+respectful.  Examples of unacceptable behavior by participants include:
+
+* The use of sexualized language or imagery
+
+* Personal attacks
+
+* Trolling or insulting/derogatory comments
+
+* Public or private harassment
+
+* Publishing other's private information, such as physical or electronic
+  addresses, without explicit permission
+
+This isn't an exhaustive list of things that you can't do. Rather, take
+it in the spirit in which it's intended: a guide to make it easier to
+be excellent to each other.
+
+This code of conduct applies to all spaces managed by the QEMU project.
+This includes IRC, the mailing lists, the issue tracker, community
+events, and any other forums created by the project team which the
+community uses for communication. This code of conduct also applies
+outside these spaces, when an individual acts as a representative or a
+member of the project or its community.
+
+By adopting this code of conduct, project maintainers commit themselves
+to fairly and consistently applying these principles to every aspect of
+managing this project.  If you believe someone is violating the code of
+conduct, please read the +:ref:`conflict-resolution` document for
+information about how to proceed.
+
+Sources
+-------
+
+This document is based on the `Fedora Code of Conduct
+<https://fedoraproject.org/code-of-conduct>`__ and the
+`Contributor Covenant version 1.3.0
+<https://www.contributor-covenant.org/version/1/3/0/code-of-conduct/>`__.
diff --git a/docs/devel/conflict-resolution.rst b/docs/devel/conflict-resolution.rst
new file mode 100644
index 0000000000..bb25f61865
--- /dev/null
+++ b/docs/devel/conflict-resolution.rst
@@ -0,0 +1,80 @@
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
+If you are experiencing conflict, please consider first addressing the
+perceived conflict directly with other involved parties, preferably through
+a real-time medium such as IRC. You could also try to get a third-party (e.g.
+a mutual friend, and/or someone with background on the issue, but not
+involved in the conflict) to intercede or mediate.
+
+If this fails or if you do not feel comfortable proceeding this way, or
+if the problem requires immediate escalation, report the issue to the QEMU
+leadership committee by sending an email to qemu@sfconservancy.org, providing
+references to the misconduct.
+For very urgent topics, you can also inform one or more members through IRC.
+The up-to-date list of members is `available on the QEMU wiki
+<https://wiki.qemu.org/Conservancy>`__.
+
+Your report will be treated confidentially by the leadership committee and
+not be published without your agreement. The QEMU leadership committee will
+then do its best to review the incident in a timely manner, and will either
+seek further information, or will make a determination on next steps.
+
+Remedies
+--------
+
+Escalating an issue to the QEMU leadership committee may result in actions
+impacting one or more involved parties. In the event the leadership
+committee has to intervene, here are some of the ways they might respond:
+
+1. Take no action. For example, if the leadership committee determines
+   the complaint has not been substantiated or is being made in bad faith,
+   or if it is deemed to be outside its purview.
+
+2. A private reprimand, explaining the consequences of continued behavior,
+   to one or more involved individuals.
+
+3. A private reprimand and request for a private or public apology
+
+4. A public reprimand and request for a public apology
+
+5. A public reprimand plus a mandatory cooling off period. The cooling
+   off period may require, for example, one or more of the following:
+   abstaining from maintainer duties; not interacting with people involved,
+   including unsolicited interaction with those enforcing the guidelines
+   and interaction on social media; being denied participation to in-person
+   events.  The cooling off period is voluntary but may escalate to a
+   temporary ban in order to enforce it.
+
+6. A temporary or permanent ban from some or all current and future QEMU
+   spaces (mailing lists, IRC, wiki, etc.), possibly including in-person
+   events.
+
+In the event of severe harassment, the leadership committee may advise that
+the matter be escalated to the relevant local law enforcement agency. It
+is however not the role of the leadership committee to initiate contact
+with law enforcement on behalf of any of the community members involved
+in an incident.
+
+Sources
+-------
+
+This document was developed based on the `Drupal Conflict Resolution
+Policy and Process <https://www.drupal.org/conflict-resolution>`__
+and the `Mozilla Consequence Ladder
+<https://github.com/mozilla/diversity/blob/master/code-of-conduct-enforcement/consequence-ladder.md>`__
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
2.30.1


