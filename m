Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 477D92C2D27
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 17:42:12 +0100 (CET)
Received: from localhost ([::1]:58764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khbON-0001iM-9A
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 11:42:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <secalert@redhat.com>)
 id 1khb9r-0002li-CE
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 11:27:11 -0500
Received: from outbound27.service-now.com ([149.96.5.6]:43202
 helo=fallback-outbound27.service-now.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <secalert@redhat.com>)
 id 1khb9l-0002G4-QJ
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 11:27:10 -0500
Received: from outbound27.service-now.com (unknown [10.248.2.211])
 by fallback-outbound27.service-now.com (Postfix) with ESMTPS id 9004215056A
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 08:27:04 -0800 (PST)
Received: from app133029.ytz3.service-now.com (unknown [10.248.2.236])
 by outbound27.service-now.com (Postfix) with ESMTP id ABE2316ED02;
 Tue, 24 Nov 2020 08:26:58 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 outbound27.service-now.com ABE2316ED02
Date: Tue, 24 Nov 2020 08:26:58 -0800 (PST)
From: Red Hat Product Security <secalert@redhat.com>
To: stefanha@gmail.com, michael.roth@amd.com, peter.maydell@linaro.org,
 darren.kenny@oracle.com, konrad.wilk@oracle.com,
 pjp@fedoraproject.org, berrange@redhat.com, sstabellini@kernel.org,
 ppandit@redhat.com, mst@redhat.com, pmatouse@redhat.com,
 qemu-devel@nongnu.org
Message-ID: <21166666.2297.1606235218694@app133029.ytz3.service-now.com>
Subject: Re: [RFC 1/1] security-process: update process information
MIME-Version: 1.0
Content-Type: multipart/mixed; 
 boundary="----=_Part_2295_31575364.1606235218694"
X-ServiceNow-Source: Notification-ec04d32213ede300196f7e276144b04e
X-ServiceNow-SysEmail-Version: 2
Precedence: bulk
Auto-Submitted: auto-generated
X-ServiceNow-Generated: true
Received-SPF: pass client-ip=149.96.5.6; envelope-from=secalert@redhat.com;
 helo=fallback-outbound27.service-now.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Red Hat Product Security <secalert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

------=_Part_2295_31575364.1606235218694
Content-Type: multipart/alternative; 
	boundary="----=_Part_2296_6868734.1606235218694"

------=_Part_2296_6868734.1606235218694
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hello!

INC1531976 ([RFC 1/1] security-process: update process information) has bee=
n updated.

Opened for:=C2=A0Prasad Pandit
Followers:=C2=A0stefanha@gmail.com, peter.maydell@linaro.org, sstabellini@k=
ernel.org, Petr Matousek, pjp@fedoraproject.org, konrad.wilk@oracle.com, mi=
chael.roth@amd.com, mst@redhat.com, qemu-devel@nongnu.org, darren.kenny@ora=
cle.com, Daniel Berrange

A Guest updated your request with the following comments:

Reply from: darren.kenny@oracle.com
=C2=A0Hi Prasad,
=C2=A0Thanks for writing this up.
=C2=A0I have some comments below on the response steps.
=C2=A0On Tuesday, 2020-11-24 at 19:52:38 +0530, P J P wrote:
> From: Prasad J Pandit=20
>
> We are about to introduce a qemu-security mailing list to report
> and triage QEMU security issues.
>
> Update the QEMU security process web page with new mailing list
> and triage details.
>
> Signed-off-by: Prasad J Pandit=20
> ---
> contribute/security-process.md | 105 +++++++++++++++++----------------
> 1 file changed, 55 insertions(+), 50 deletions(-)
>
> diff --git a/contribute/security-process.md b/contribute/security-process=
.md
> index 1239967..a03092c 100644
> --- a/contribute/security-process.md
> +++ b/contribute/security-process.md
=C2=A0...
=C2=A0> +## How we respond:
> +
> +* Steps to triage:
> + - Examine and validate the issue details to confirm whether the
> + issue is genuine and can be misused for malicious purposes.
> + - Determine its worst case impact and severity(Low/M/I/Critical)
> + - Negotiate embargo timeline (if required)
> + - Request a CVE and open an upstream bug
> + - Create an upstream fix patch
> +
> +* Above security lists are operated by select analysts, maintainers and/=
or
> + representatives from downstream communities.
> +
> +* List members follow a **responsible disclosure** policy. Any non-publi=
c
> + information you share about security issues, is kept confidential withi=
n the
> + respective affiliated companies. Such information shall not be passed o=
n to
> + any third parties, including Xen Security Project, without your prior
> + permission.
> +
> +* We aim to triage security issues within maximum of 60 days.
=C2=A0I always understood triage to be the initial steps in assessing a bug=
:
=C2=A0- determining if it is a security bug, in this case
=C2=A0- then deciding on the severity of it
=C2=A0I would not expect triage to include seeing it through to the point
where there is a fix as in the steps above and as such that definition
of triage should probably have a shorter time frame.
=C2=A0At this point, if it is not a security bug, then it should just be
logged as any other bug in Qemu, which goes on to qemu-devel then.
=C2=A0But, if it is a security bug - then that is when the next steps would=
 be
taken, to (not necessarily in this order):
=C2=A0- negotiate an embargo (should the predefined 60 days be insufficient=
)
=C2=A0 - don't know if you need to mention that this would include downstre=
am
 in this too, since they will be the ones most likely to need the
 time to distribute a fix
=C2=A0- request a CVE
=C2=A0- create a fix for upstream
=C2=A0 - distros can work on bringing that back into downstream as needed,
 within the embargo period
=C2=A0I do feel that it is worth separating the 2 phases of triage and beyo=
nd,
but of course that is only my thoughts on it, I'm sure others will have
theirs.
=C2=A0Thanks,
=C2=A0Darren.

How can I track and update my request?

To respond, reply to this email. You may also create a new email and includ=
e the request number (INC1531976) in the subject.

Thank you,
Product Security

Ref:MSG36787539
------=_Part_2296_6868734.1606235218694
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head></head><body><div><p style=3D"margin-top:0;margin-bottom:10px;"=
>Hello!</p><p style=3D"margin-top:0;margin-bottom:10px;">INC1531976 ([RFC 1=
/1] security-process: update process information) has been updated.</p><p s=
tyle=3D"margin-top:0;margin-bottom:10px;">Opened for:&nbsp;Prasad Pandit<br=
>Followers:&nbsp;stefanha@gmail.com, peter.maydell@linaro.org, sstabellini@=
kernel.org, Petr Matousek, pjp@fedoraproject.org, konrad.wilk@oracle.com, m=
ichael.roth@amd.com, mst@redhat.com, qemu-devel@nongnu.org, darren.kenny@or=
acle.com, Daniel Berrange</p></div>
<p style=3D"margin-top: 10px; margin-bottom: 10px;">A Guest updated your re=
quest with the following comments:</p>
<div style=3D"padding: 10px 0 10px 10px; background-color: ivory;"><div>Rep=
ly from: darren.kenny@oracle.com</div><div>&nbsp;</div><div>Hi Prasad,</div=
><div>&nbsp;</div><div>Thanks for writing this up.</div><div>&nbsp;</div><d=
iv>I have some comments below on the response steps.</div><div>&nbsp;</div>=
<div>On Tuesday, 2020-11-24 at 19:52:38 +0530, P J P wrote:</div><div>&gt; =
From: Prasad J Pandit </div><div>&gt;</div><div>&gt; We are about to introd=
uce a qemu-security mailing list to report</div><div>&gt; and triage QEMU s=
ecurity issues.</div><div>&gt;</div><div>&gt; Update the QEMU security proc=
ess web page with new mailing list</div><div>&gt; and triage details.</div>=
<div>&gt;</div><div>&gt; Signed-off-by: Prasad J Pandit </div><div>&gt; ---=
</div><div>&gt;  contribute/security-process.md | 105 +++++++++++++++++----=
------------</div><div>&gt;  1 file changed, 55 insertions(+), 50 deletions=
(-)</div><div>&gt;</div><div>&gt; diff --git a/contribute/security-process.=
md b/contribute/security-process.md</div><div>&gt; index 1239967..a03092c 1=
00644</div><div>&gt; --- a/contribute/security-process.md</div><div>&gt; ++=
+ b/contribute/security-process.md</div><div>&nbsp;</div><div>...</div><div=
>&nbsp;</div><div>&gt; +## How we respond:</div><div>&gt; +</div><div>&gt; =
+* Steps to triage:</div><div>&gt; +    - Examine and validate the issue de=
tails to confirm whether the</div><div>&gt; +      issue is genuine and can=
 be misused for malicious purposes.</div><div>&gt; +    - Determine its wor=
st case impact and severity(Low/M/I/Critical)</div><div>&gt; +    - Negotia=
te embargo timeline (if required)</div><div>&gt; +    - Request a CVE and o=
pen an upstream bug</div><div>&gt; +    - Create an upstream fix patch</div=
><div>&gt; +</div><div>&gt; +* Above security lists are operated by select =
analysts, maintainers and/or</div><div>&gt; +  representatives from downstr=
eam communities.</div><div>&gt; +</div><div>&gt; +* List members follow a *=
*responsible disclosure** policy. Any non-public</div><div>&gt; +  informat=
ion you share about security issues, is kept confidential within the</div><=
div>&gt; +  respective affiliated companies. Such information shall not be =
passed on to</div><div>&gt; +  any third parties, including Xen Security Pr=
oject, without your prior</div><div>&gt; +  permission.</div><div>&gt; +</d=
iv><div>&gt; +* We aim to triage security issues within maximum of 60 days.=
</div><div>&nbsp;</div><div>I always understood triage to be the initial st=
eps in assessing a bug:</div><div>&nbsp;</div><div>- determining if it is a=
 security bug, in this case</div><div>&nbsp;</div><div>- then deciding on t=
he severity of it</div><div>&nbsp;</div><div>I would not expect triage to i=
nclude seeing it through to the point</div><div>where there is a fix as in =
the steps above and as such that definition</div><div>of triage should prob=
ably have a shorter time frame.</div><div>&nbsp;</div><div>At this point, i=
f it is not a security bug, then it should just be</div><div>logged as any =
other bug in Qemu, which goes on to qemu-devel then.</div><div>&nbsp;</div>=
<div>But, if it is a security bug - then that is when the next steps would =
be</div><div>taken, to (not necessarily in this order):</div><div>&nbsp;</d=
iv><div>- negotiate an embargo (should the predefined 60 days be insufficie=
nt)</div><div>&nbsp;</div><div>  - don't know if you need to mention that t=
his would include downstream</div><div>    in this too, since they will be =
the ones most likely to need the</div><div>    time to distribute a fix</di=
v><div>&nbsp;</div><div>- request a CVE</div><div>&nbsp;</div><div>- create=
 a fix for upstream</div><div>&nbsp;</div><div>  - distros can work on brin=
ging that back into downstream as needed,</div><div>    within the embargo =
period</div><div>&nbsp;</div><div>I do feel that it is worth separating the=
 2 phases of triage and beyond,</div><div>but of course that is only my tho=
ughts on it, I'm sure others will have</div><div>theirs.</div><div>&nbsp;</=
div><div>Thanks,</div><div>&nbsp;</div><div>Darren.</div></div>
<div><p style=3D"margin-top:20px;margin-bottom:10px;"><strong>How can I tra=
ck and update my request?</strong></p><p style=3D"margin-top:0;margin-botto=
m:10px;">To respond, reply to this email. You may also create a new email a=
nd include the request number (INC1531976) in the subject.</p></div>
<p style=3D"margin-top: 14px; margin-bottom: 0;">Thank you,<br>Product Secu=
rity</p><div>&nbsp;</div><div style=3D"display:inline">Ref:MSG36787539</div=
></body></html>
------=_Part_2296_6868734.1606235218694--

------=_Part_2295_31575364.1606235218694--

