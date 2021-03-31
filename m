Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B06AB3503F3
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 17:57:31 +0200 (CEST)
Received: from localhost ([::1]:58688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRdDm-00033F-NT
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 11:57:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRd4o-0002Uu-Re
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 11:48:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRd4j-0003Kr-Qi
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 11:48:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617205687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/+F0SkDiOwXaGaasQrGOh0vOjJgJXe0Fk24TfaRIcZ8=;
 b=bKzr7xH15rRNGiFaGwPACgDR2/UR05w3348ldArufCopbxLs+oV54SLRKnyRTJKvWivaEE
 TlXi630uAexcDliRrDNAEP9qSq5DTqRuT4tkh+KzPEjz4UsUWYekRg8JYb20Dj61YJeXfc
 VG9yTZalI2owJj+eVtTv9R82O1gpUsY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-3vYKyCdNNa22rzDxJItOyw-1; Wed, 31 Mar 2021 11:48:03 -0400
X-MC-Unique: 3vYKyCdNNa22rzDxJItOyw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D54F91009E29;
 Wed, 31 Mar 2021 15:48:02 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-75.ams2.redhat.com [10.36.112.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3AB45C1BB;
 Wed, 31 Mar 2021 15:47:57 +0000 (UTC)
Subject: Re: [PATCH] docs: Add a QEMU Code of Conduct and Conflict Resolution
 Policy document
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210331150527.14857-1-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <72bc8020-2028-82db-219c-a6ae311e26df@redhat.com>
Date: Wed, 31 Mar 2021 17:47:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210331150527.14857-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, berrange@redhat.com, agraf@csgraf.de,
 stefanha@redhat.com, alex.bennee@linaro.org, afaerber@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 31/03/2021 17.05, Paolo Bonzini wrote:
> In an ideal world, we would all get along together very well, always be
> polite and never end up in huge conflicts. And even if there are conflicts,
> we would always handle each other fair and respectfully. Unfortunately,
> this is not an ideal world and sometimes people forget how to interact with
> each other in a professional and respectful way. Fortunately, this seldom
> happens in the QEMU community, but for such rare cases it is preferrable
> to have a basic code of conduct document available to show to people
> who are misbehaving.  In case that does not help yet, we should also have
> a conflict resolution policy ready that can be applied in the worst case.
> 
> The Code of Conduct document tries to be short and to the point while
> trying to remain friendly and welcoming; it is based on the Fedora Code
> of Conduct[1] with extra detail added based on the Contributor Covenant
> 1.3.0[2].  Other proposals included the Contributor Covenant 1.3.0 itself
> or the Django Code of Conduct[3] (which is also a derivative of Fedora's)
> but, in any case, there was agreement on keeping the conflict resolution
> policy separate from the CoC itself.
> 
> An important point is whether to apply the code of conduct to violations
> that occur outside public spaces.  The text herein restricts that to
> individuals acting as a representative or a member of the project or
> its community.  This is intermediate between the Contributor Covenant
> (which only mentions representatives of the community, for example using
> an official project e-mail address or posting via an official social media
> account), and the Django Code of Conduct, which says that violations of
> this code outside these spaces "may" be considered but does not limit
> this further.
> 
> The conflict resolution policy is based on the Drupal Conflict Resolution
> Policy[4] and its derivative, the Mozilla Consequence Ladder[5].
> 
> [1] https://www.fedoraproject.com/code-of-conduct/
> [2] https://www.contributor-covenant.org/version/1/3/0/code-of-conduct/
> [3] https://www.djangoproject.com/conduct/
> [4] https://www.drupal.org/conflict-resolution
> [5] https://github.com/mozilla/diversity/blob/master/code-of-conduct-enforcement/consequence-ladder.md
> 
> Co-developed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   docs/devel/code-of-conduct.rst     | 60 ++++++++++++++++++++++
>   docs/devel/conflict-resolution.rst | 80 ++++++++++++++++++++++++++++++
>   docs/devel/index.rst               |  2 +
>   3 files changed, 142 insertions(+)
>   create mode 100644 docs/devel/code-of-conduct.rst
>   create mode 100644 docs/devel/conflict-resolution.rst
> 
> diff --git a/docs/devel/code-of-conduct.rst b/docs/devel/code-of-conduct.rst
> new file mode 100644
> index 0000000000..83e8855250
> --- /dev/null
> +++ b/docs/devel/code-of-conduct.rst
> @@ -0,0 +1,60 @@
> +Code of Conduct
> +===============
> +
> +The QEMU community is made up of a mixture of professionals and
> +volunteers from all over the world. Diversity is one of our strengths,
> +but it can also lead to communication issues and unhappiness.
> +To that end, we have a few ground rules that we ask people to adhere to.
> +
> +* Be welcoming. We are committed to making participation in this project
> +  a harassment-free experience for everyone, regardless of level of
> +  experience, gender, gender identity and expression, sexual orientation,
> +  disability, personal appearance, body size, race, ethnicity, age, religion,
> +  or nationality.
> +
> +* Be respectful. Not all of us will agree all the time.  Disagreements, both
> +  social and technical, happen all the time and the QEMU community is no
> +  exception. When we disagree, we try to understand why.  It is important that
> +  we resolve disagreements and differing views constructively.  Members of the
> +  QEMU community should be respectful when dealing with other contributors as
> +  well as with people outside the QEMU community and with users of QEMU.
> +
> +Harassment and other exclusionary behavior are not acceptable. A community
> +where people feel uncomfortable or threatened is neither welcoming nor
> +respectful.  Examples of unacceptable behavior by participants include:
> +
> +* The use of sexualized language or imagery
> +
> +* Personal attacks
> +
> +* Trolling or insulting/derogatory comments
> +
> +* Public or private harassment
> +
> +* Publishing other's private information, such as physical or electronic
> +addresses, without explicit permission
> +
> +This isn't an exhaustive list of things that you can't do. Rather, take
> +it in the spirit in which it's intended—a guide to make it easier to

s/intended—a/intended — a/

With that fixed:

Reviewed-by: Thomas Huth <thuth@redhat.com>

Thanks for putting this together!


> +be excellent to each other.
> +
> +This code of conduct applies to all spaces managed by the QEMU project.
> +This includes IRC, the mailing lists, the issue tracker, community
> +events, and any other forums created by the project team which the
> +community uses for communication. This code of conduct also applies
> +outside these spaces, when an individual acts as a representative or a
> +member of the project or its community.
> +
> +By adopting this code of conduct, project maintainers commit themselves
> +to fairly and consistently applying these principles to every aspect of
> +managing this project.  If you believe someone is violating the code of
> +conduct, please read the +:ref:`conflict-resolution` document for
> +information about how to proceed.
> +
> +Sources
> +-------
> +
> +This document is based on the `Fedora Code of Conduct
> +<https://fedoraproject.org/code-of-conduct>`__ and the
> +`Contributor Covenant version 1.3.0
> +<https://www.contributor-covenant.org/version/1/3/0/code-of-conduct/>`__.
> diff --git a/docs/devel/conflict-resolution.rst b/docs/devel/conflict-resolution.rst
> new file mode 100644
> index 0000000000..1e0bb41674
> --- /dev/null
> +++ b/docs/devel/conflict-resolution.rst
> @@ -0,0 +1,80 @@
> +.. _conflict-resolution:
> +
> +Conflict Resolution Policy
> +==========================
> +
> +Conflicts in the community can take many forms, from someone having a
> +bad day and using harsh and hurtful language on the mailing list to more
> +serious code of conduct violations (including sexist/racist statements
> +or threats of violence), and everything in between.
> +
> +For the vast majority of issues, we aim to empower individuals to first
> +resolve conflicts themselves, asking for help when needed, and only
> +after that fails to escalate further. This approach gives people more
> +control over the outcome of their dispute.
> +
> +How we resolve conflicts
> +------------------------
> +
> +If you are experiencing conflict, please consider first addressing the
> +perceived conflict directly with other involved parties, preferably through
> +a real-time medium such as IRC. You could also try to get a third-party (e.g.
> +a mutual friend, and/or someone with background on the issue, but not
> +involved in the conflict) to intercede or mediate.
> +
> +If this fails or if you do not feel comfortable proceeding this way, or
> +if the problem requires immediate escalation, report the issue to the QEMU
> +leadership committee by sending an email to qemu@sfconservancy.org, providing
> +references to the misconduct.
> +For very urgent topics, you can also inform one or more members through IRC.
> +The up-to-date list of members is `available on the QEMU wiki
> +<https://wiki.qemu.org/Conservancy>`__.
> +
> +Your report will be treated confidentially by the leadership committee and
> +not be published without your agreement. The QEMU leadership committee will
> +then do its best to review the incident timely, and will either seek further
> +information, or will make a determination on next steps.
> +
> +Remedies
> +--------
> +
> +Escalating an issue to the QEMU leadership committee may result in actions
> +impacting one or more involved parties. In the event the leadership
> +committee has to intervene, here are some of the ways they might respond:
> +
> +1. Take no action. For example, if the leadership committee determines
> +   the complaint has not been substantiated or is being made in bad faith,
> +   or if it is deemed to be outside its purview.
> +
> +2. A private reprimand, explaining the consequences of continued behavior,
> +   to one or more involved individuals.
> +
> +3. A private reprimand and request for a private or public apology
> +
> +4. A public reprimand and request for a public apology
> +
> +5. A public reprimand plus a mandatory cooling off period. The cooling
> +   off period may require, for example, one or more of the following:
> +   abstaining from maintainer duties; not interacting with people involved,
> +   including unsolicited interaction with those enforcing the guidelines
> +   and interaction on social media; being denied participation to in-person
> +   events.  The cooling off period is voluntary but may escalate to a
> +   temporary ban in order to enforce it.
> +
> +6. A temporary or permanent ban from some or all current and future QEMU
> +   spaces (mailing lists, IRC, wiki, etc.), possibly including in-person
> +   events.
> +
> +In the event of severe harassment, the leadership committee may advise that
> +the matter be escalated to the relevant local law enforcement agency. It
> +is however not the role of the leadership committee to initiate contact
> +with law enforcement on behalf of any of the community members involved
> +in an incident.
> +
> +Sources
> +-------
> +
> +This document was developed based on the `Drupal Conflict Resolution
> +Policy and Process <https://www.drupal.org/conflict-resolution>`__
> +and the `Mozilla Consequence Ladder
> +<https://github.com/mozilla/diversity/blob/master/code-of-conduct-enforcement/consequence-ladder.md>`__
> diff --git a/docs/devel/index.rst b/docs/devel/index.rst
> index 7c424ea6d7..416261505f 100644
> --- a/docs/devel/index.rst
> +++ b/docs/devel/index.rst
> @@ -14,6 +14,8 @@ Contents:
>      :maxdepth: 2
>      :includehidden:
>   
> +   code-of-conduct
> +   conflict-resolution
>      build-system
>      style
>      kconfig
> 


