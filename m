Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 521926AB949
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 10:08:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ6oa-0001t4-HG; Mon, 06 Mar 2023 04:07:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1pZ6oX-0001rw-OQ
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 04:07:25 -0500
Received: from mga01.intel.com ([192.55.52.88])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1pZ6oU-0003dq-Fn
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 04:07:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678093642; x=1709629642;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to; bh=frlYEQZFWPF4uZ9+ItkLzNObS7eez2CchKc6ZDSQIc8=;
 b=Cd2Pz2Sj4odReC673YpW405na/csXygJlUmMbWzenJB4MYvbWpD46Vbp
 UeQ3+yh5jt2AEeyHkkbdcLkEhEOW0ME2kvmFvnbFWAT9yJYMhCnci8nyR
 jRpPhhjKNSenXTQ1GGyJNJF4BaTZ9AkPrUt3U2HK0x6hY0M3PVSLbWco8
 l7JtSeSridF7g1mIQTdMS82PFXQhUuO8MCMrvFPWWYPRsKCNEZ88Cf4EP
 ScFxPJmCtYiCPST0+E9TR9JL4y9NJhv2Y7BbTy8Fzo6s2BS/cV8CUDuze
 jfCqK8W0NRXAO0M9vz2ad95rU8Cg62BivEUPq3XIHafuSRHXpjR9oJFdZ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="363120046"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
 d="scan'208,217";a="363120046"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 01:07:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="669363878"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
 d="scan'208,217";a="669363878"
Received: from wangwei-desk.sh.intel.com (HELO [10.239.159.137])
 ([10.239.159.137])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 01:07:07 -0800
Content-Type: multipart/alternative;
 boundary="------------uvxlCCAxGYsMSLnvx1m3jht9"
Message-ID: <4a218f8d-1094-2130-8c96-a09f07fc8f23@intel.com>
Date: Mon, 6 Mar 2023 17:11:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: KVM developers conference call agenda
Content-Language: en-US
To: juan.quintela@gmail.com, afaerber@suse.de, ale@rev.ng, anjo@rev.ng,
 bazulay@redhat.com, bbauman@redhat.com, chao.p.peng@linux.intel.com,
 cjia@nvidia.com, cw@f00f.org, david.edmondson@oracle.com,
 Eric Northup <digitaleric@google.com>, dustin.kirkland@canonical.com,
 eblake@redhat.com, edgar.iglesias@gmail.com, elena.ufimtseva@oracle.com,
 eric.auger@redhat.com, f4bug@amsat.org,
 Felipe Franciosi <felipe.franciosi@nutanix.com>,
 "iggy@theiggy.com" <iggy@kws1.com>, Warner Losh <wlosh@bsdimp.com>,
 jan.kiszka@web.de, jgg@nvidia.com, jidong.xiao@gmail.com,
 jjherne@linux.vnet.ibm.com, joao.m.martins@oracle.com,
 konrad.wilk@oracle.com, kvm@vger.kernel.org, mburton@qti.qualcomm.com,
 mdean@redhat.com, mimu@linux.vnet.ibm.com, peter.maydell@linaro.org,
 qemu-devel@nongnu.org, quintela@redhat.com, richard.henderson@linaro.org,
 shameerali.kolothum.thodi@huawei.com, stefanha@gmail.com, z.huo@139.com,
 zwu.kernel@gmail.com, dgilbert@redhat.com
References: <calendar-639eb22a-8fff-44ce-996b-11c83fd721e8@google.com>
From: Wei Wang <wei.w.wang@intel.com>
In-Reply-To: <calendar-639eb22a-8fff-44ce-996b-11c83fd721e8@google.com>
Received-SPF: pass client-ip=192.55.52.88; envelope-from=wei.w.wang@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_FONT_LOW_CONTRAST=0.001, HTML_MESSAGE=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is a multi-part message in MIME format.
--------------uvxlCCAxGYsMSLnvx1m3jht9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/21/23 21:46, juan.quintela@gmail.com wrote:
> KVM developers conference call
>
>
> Hi for today call:
> Trivial stuff (less that 5mins each)
> - should we record the sessions
> - should we have the call every week.
> We have on the backburner:
> * TDX migration
>
Hi Juan,
Can I get 30 min (or more if no more other topics)  in tomorrow's call to
continue the discussion on TDX live migration?
I also did some investigation on the previous comments about MigTD-to-MigTD
communication (remove socat), and have an update to discuss.

Thanks,
Wei

> * VFIO/VPDA/Vhost migration
> * Single binary qemu
>
>
> The future of icount
>
> Do we have an agenda for next weeks KVM call yet? If there is space I'd
> like to take some time to discuss the future direction of icount.
>
> Specifically I believe there might be some proposals for how we could
> support icount with MTTCG worth discussing. From my point of view icount
> provides too things:
>
> - a sense of time vaguely related to execution rather than wall clock
> - determinism
>
> I would love to divorce the former from icount and punt it to plugins.
> The plugin would be free to instrument as heavily or lightly as it sees
> fit and provide its best guess as to guest time on demand. I wrote this
> idea up as a card in Linaro's JIRA if anyone is interested:
>
> https://linaro.atlassian.net/browse/QEMU-481
>
> Being able to punt cost modelling and sense of time into plugins would
> allow the core icount support to concentrate on determinism. Then any
> attempt to enable icount for MTTCG would then have to ensure it stays
> deterministic.
>
> Richard and I have discussed the problem a few times and weren't sure it
> was solvable but I'm totally open to hearing ideas on how to do it.
> Fundamentally I think we would have to ensure any TB's doing IO would
> have to execute in an exclusive context. The TCG code already has
> mechanisms to ensure all IO is only done at the end of blocks so it
> doesn't seem a huge leap to ensure we execute those blocks exclusively.
> However there is still the problem of what to do about other pure
> computation threads getting ahead or behind of the IO blocks on
> subsequent runs.
>
> KVM developers conference call
> Tuesday 2023-02-21 ⋅ 15:00 – 16:00 (Central European Time - Madrid)
> If you need call details, please contact me: quintela@redhat.com
>
>
>     Location
>
> https://meet.jit.si/kvmcallmeeting
> View map 
> <https://www.google.com/url?q=https%3A%2F%2Fmeet.jit.si%2Fkvmcallmeeting&sa=D&ust=1677419160000000&usg=AOvVaw0heTI2pkoiDPVZgv6XFxlS>
>
>
>     Guests
>
> Philippe Mathieu-Daudé <mailto:f4bug@amsat.org>
> Joao Martins <mailto:joao.m.martins@oracle.com>
> quintela@redhat.com <mailto:quintela@redhat.com>
> Meirav Dean <mailto:mdean@redhat.com>
> Felipe Franciosi <mailto:felipe@nutanix.com>
> afaerber@suse.de <mailto:afaerber@suse.de>
> bazulay@redhat.com <mailto:bazulay@redhat.com>
> bbauman@redhat.com <mailto:bbauman@redhat.com>
> cw@f00f.org <mailto:cw@f00f.org>
> dustin.kirkland@canonical.com <mailto:dustin.kirkland@canonical.com>
> eblake@redhat.com <mailto:eblake@redhat.com>
> edgar.iglesias@gmail.com <mailto:edgar.iglesias@gmail.com>
> Eric Northup <mailto:digitaleric@google.com>
> eric.auger@redhat.com <mailto:eric.auger@redhat.com>
> iggy@theiggy.com <mailto:iggy@theiggy.com>
> jan.kiszka@web.de <mailto:jan.kiszka@web.de>
> jidong.xiao@gmail.com <mailto:jidong.xiao@gmail.com>
> jjherne@linux.vnet.ibm.com <mailto:jjherne@linux.vnet.ibm.com>
> mimu@linux.vnet.ibm.com <mailto:mimu@linux.vnet.ibm.com>
> Peter Maydell <mailto:peter.maydell@linaro.org>
> richard.henderson@linaro.org <mailto:richard.henderson@linaro.org>
> stefanha@gmail.com <mailto:stefanha@gmail.com>
> Warner Losh <mailto:imp@bsdimp.com>
> z.huo@139.com <mailto:z.huo@139.com>
> zwu.kernel@gmail.com <mailto:zwu.kernel@gmail.com>
> Jason Gunthorpe <mailto:jgg@nvidia.com>
> Neo Jia <mailto:cjia@nvidia.com>
> David Edmondson <mailto:david.edmondson@oracle.com>
> Elena Ufimtseva <mailto:elena.ufimtseva@oracle.com>
> Konrad Wilk <mailto:konrad.wilk@oracle.com>
> ale@rev.ng <mailto:ale@rev.ng>
> anjo@rev.ng <mailto:anjo@rev.ng>
> Shameerali Kolothum Thodi <mailto:shameerali.kolothum.thodi@huawei.com>
> Wang, Wei W <mailto:wei.w.wang@intel.com>
> Chao Peng <mailto:chao.p.peng@linux.intel.com>
> kvm-devel <mailto:kvm@vger.kernel.org>
> qemu-devel@nongnu.org <mailto:qemu-devel@nongnu.org>
> mburton@qti.qualcomm.com <mailto:mburton@qti.qualcomm.com>
>

--------------uvxlCCAxGYsMSLnvx1m3jht9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <div class="moz-cite-prefix">On 2/21/23 21:46,
      <a class="moz-txt-link-abbreviated" href="mailto:juan.quintela@gmail.com">juan.quintela@gmail.com</a> wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:calendar-639eb22a-8fff-44ce-996b-11c83fd721e8@google.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title></title>
      <!--[if !mso]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->
      <meta name="viewport" content="width=device-width,initial-scale=1">
      <meta name="color-scheme" content="light dark">
      <meta name="supported-color-schemes" content="light dark">
      <style>body, html {
        font-family: Roboto, Helvetica, Arial, sans-serif;
      }body {
        margin: 0;
        padding: 0;
        -webkit-font-smoothing: antialiased;
        -webkit-text-size-adjust: 100%;
        -ms-text-size-adjust: 100%;
      }#outlook a {
        padding: 0;
      }.ReadMsgBody {
        width: 100%;
      }.ExternalClass {
        width: 100%;
      }.ExternalClass * {
        line-height: 100%;
      }table,
      td {
        mso-table-lspace: 0pt;
        mso-table-rspace: 0pt;
      }img {
        border: 0;
        height: auto;
        line-height: 100%;
        outline: none;
        text-decoration: none;
        -ms-interpolation-mode: bicubic;
      }p {
        display: block;
        margin: 13px 0;
      }</style>
      <!--[if !mso]><!-->
      <style></style>
      <!--<![endif]-->
      <!--[if mso]>
          <xml>
          <o:OfficeDocumentSettings>
            <o:AllowPNG/>
            <o:PixelsPerInch>96</o:PixelsPerInch>
          </o:OfficeDocumentSettings>
          </xml>
          <![endif]-->
      <!--[if lte mso 11]>
          <style>
            .outlook-group-fix { width:100% !important; }
          </style>
    <![endif]-->
      <!--[if !mso]><!-- -->
      <style>body, html {font-family:Roboto,Helvetica,Arial,sans-serif;}@font-face {
  font-family: 'Roboto';
  font-style: normal;
  font-weight: 400;
  src: url(//fonts.gstatic.com/s/roboto/v18/KFOmCnqEu92Fr1Mu4mxP.ttf) format('truetype');
}@font-face {
  font-family: 'Roboto';
  font-style: normal;
  font-weight: 500;
  src: url(//fonts.gstatic.com/s/roboto/v18/KFOlCnqEu92Fr1MmEU9fBBc9.ttf) format('truetype');
}@font-face {
  font-family: 'Roboto';
  font-style: normal;
  font-weight: 700;
  src: url(//fonts.gstatic.com/s/roboto/v18/KFOlCnqEu92Fr1MmWUlfBBc9.ttf) format('truetype');
}@font-face {
  font-family: 'Material Icons Extended';
  font-style: normal;
  font-weight: 400;
  src: url(//fonts.gstatic.com/s/materialiconsextended/v149/kJEjBvgX7BgnkSrUwT8UnLVc38YydejYY-oE_LvM.ttf) format('truetype');
}@font-face {
  font-family: 'Google Material Icons';
  font-style: normal;
  font-weight: 400;
  src: url(//fonts.gstatic.com/s/googlematerialicons/v130/Gw6kwdfw6UnXLJCcmafZyFRXb3BL9rvi0QZG3g.otf) format('opentype');
}.google-material-icons {
  font-family: 'Google Material Icons';
  font-weight: normal;
  font-style: normal;
  font-size: 24px;
  line-height: 1;
  letter-spacing: normal;
  text-transform: none;
  display: inline-block;
  white-space: nowrap;
  word-wrap: normal;
  direction: ltr;
}@font-face {
  font-family: 'Google Material Icons Filled';
  font-style: normal;
  font-weight: 400;
  src: url(//fonts.gstatic.com/s/googlematerialiconsfilled/v96/WWXFlimHYg6HKI3TavMkbKdhBmDvgach8TVpeGsuueSZJH4.otf) format('opentype');
}.google-material-icons-filled {
  font-family: 'Google Material Icons Filled';
  font-weight: normal;
  font-style: normal;
  font-size: 24px;
  line-height: 1;
  letter-spacing: normal;
  text-transform: none;
  display: inline-block;
  white-space: nowrap;
  word-wrap: normal;
  direction: ltr;
}@font-face {
  font-family: 'Google Sans';
  font-style: normal;
  font-weight: 400;
  src: url(//fonts.gstatic.com/s/googlesans/v14/4UaGrENHsxJlGDuGo1OIlL3Owps.ttf) format('truetype');
}@font-face {
  font-family: 'Google Sans';
  font-style: normal;
  font-weight: 500;
  src: url(//fonts.gstatic.com/s/googlesans/v14/4UabrENHsxJlGDuGo1OIlLU94YtzCwM.ttf) format('truetype');
}@font-face {
  font-family: 'Google Sans';
  font-style: normal;
  font-weight: 700;
  src: url(//fonts.gstatic.com/s/googlesans/v14/4UabrENHsxJlGDuGo1OIlLV154tzCwM.ttf) format('truetype');
}</style><!--<![endif]-->
      <style>.body-container {
          padding-left: 16px;
          padding-right: 16px;
        }</style>
      <style>u+.body .body-container,
        body[data-outlook-cycle] .body-container,
        #MessageViewBody .body-container {
          padding-left: 0;
          padding-right: 0;
        }</style>
      <style></style>
      <style>.appointment-buttons th {
        display: block;
        clear: both;
        float: left;
        margin-top: 12px;
      }.appointment-buttons th a {
        float: left;
      }#MessageViewBody .appointment-buttons th {
       margin-top: 24px;
      }</style>
      <style></style>
      <style>.main-container-inner,
      .info-bar-inner {
        padding: 12px 16px !important;
      }.main-column-table-ltr {
        padding-right: 0 !important;
      }.main-column-table-rtl {
        padding-left: 0 !important;
      }.primary-text {
        color: #3c4043 !important;
      }.secondary-text,
      .phone-number a {
        color: #70757a !important;
      }.accent-text {
        color: #1a73e8 !important;
      }.accent-text-dark {
        color: #185abc !important;
      }.grey-button-text,
      .attachment-chip a {
        color: #5f6368 !important;
      }.primary-button {
        background-color: #1a73e8 !important;
      }.primary-button-text {
        color: #fff !important;
      }.underline-on-hover:hover {
        text-decoration: underline !important;
      }.grey-infobar-text {
        color: #202124 !important;
      }</style>
      <style></style>
      <!--[if !mso]><!-->
      <style>.prevent-link a {
        color: inherit !important;
        text-decoration: none !important;
        font-size: inherit !important;
        font-family: inherit !important;
        font-weight: inherit !important;
        line-height: inherit !important;
      }</style>
      <!--<![endif]-->
      <!--[if mso | IE]>
      <style>
        .main-container-inner {
          padding: 24px 32px !important;
        }

        .info-bar-inner {
          padding: 12px 32px !important;
        }

        .cse-banner .encryption-icon {
          /* We use the IE workaround instead. */
          background-image: none !important;
        }

        .cse-banner .encryption-icon .ms-fallback {
          display: block !important;
        }

        /* NB: Some MS clients ignore dark-scheme styling and apply their own, so there's nothing we can do to help there. */
        @media (prefers-color-scheme: dark) {
          .cse-banner:not([class^="x_"]) .encryption-icon .ms-fallback {
            display: none !important;
          }

          .cse-banner:not([class^="x_"]) .encryption-icon .ms-fallback-dark {
            display: block !important;
          }
        }
      </style>
    <![endif]--> <span itemscope=""
        itemtype="http://schema.org/InformAction"><span
          style="display:none" itemprop="about" itemscope=""
          itemtype="http://schema.org/EmailMessage">
          <meta itemprop="description" content="juan.quintela@gmail.com:
            Hi for today call: Trivial stuff (less that 5mins each) -
            should we record the sessions - should we have the call
            every week. We have on the backburner: * TDX migration *
            VFIO/VPDA/Vhost migration * Single binary qemu The future of
            icount Do we have an agenda for next weeks KVM call yet? If
            there is space I'd like to take some time to discuss the
            future direction of icount. Specifically I believe there
            might be some proposals for how we could support icount with
            MTTCG worth discussing. From my point of view icount
            provides too things: - a sense of time vaguely related to
            execution rather than wall clock - determinism I would love
            to divorce the former from icount and punt it to plugins.
            The plugin would be free to instrument as heavily or lightly
            as it sees fit and provide its best guess as to guest time
            on demand. I wrote this idea up as a card in Linaro's JIRA
            if anyone is interested:
            https://linaro.atlassian.net/browse/QEMU-481 Being able to
            punt cost modelling and sense of time into plugins would
            allow the core icount support to concentrate on determinism.
            Then any attempt to enable icount for MTTCG would then have
            to ensure it stays deterministic. Richard and I have
            discussed the problem a few times and weren't sure it was
            solvable but I'm totally open to hearing ideas on how to do
            it. Fundamentally I think we would have to ensure any TB's
            doing IO would have to execute in an exclusive context. The
            TCG code already has mechanisms to ensure all IO is only
            done at the end of blocks so it doesn't seem a huge leap to
            ensure we execute those blocks exclusively. However there is
            still the problem of what to do about other pure computation
            threads getting ahead or behind of the IO blocks on
            subsequent runs.">
        </span><span itemprop="object" itemscope=""
          itemtype="http://schema.org/Event">
          <meta itemprop="eventStatus"
            content="http://schema.org/EventScheduled">
          <span itemprop="publisher" itemscope=""
            itemtype="http://schema.org/Organization">
            <meta itemprop="name" content="Google Calendar">
          </span>
          <meta itemprop="eventId/googleCalendar"
            content="5dt5ji87j5qrc00o63ktq7ghou_20230221T140000Z">
          <span style="display: none; font-size: 1px; color: #fff;
            line-height: 1px; height: 0; max-height: 0; width: 0;
            max-width: 0; opacity: 0; overflow: hidden;" itemprop="name">KVM
            developers conference call</span><span aria-hidden="true"><time
              itemprop="startDate" datetime="20230221T140000Z"></time><time
              itemprop="endDate" datetime="20230221T150000Z"></time></span>
          <table role="presentation" style="width:100%;"
            class="body-container" cellspacing="0" cellpadding="0"
            border="0" align="center">
            <tbody>
              <tr>
                <td style="" class="" align="left"><!--[if mso | IE]><table border="0" cellpadding="0" cellspacing="0" role="presentation"><tr><td height="16" style="height:16px;"><![endif]-->
                  <div style="height:16px;" aria-hidden="true">   </div>
                  <!--[if mso | IE]></td></tr></table><![endif]-->
                  <table role="presentation" style="width:100%;"
                    class="" cellspacing="0" cellpadding="0" border="0"
                    align="center">
                    <tbody>
                      <tr>
                        <td style="" class="" align="left"><span
                            itemscope=""
                            itemtype="http://schema.org/EmailMessage">
                            <p itemprop="description"><br>
                              Hi for today call:<br>
                              Trivial stuff (less that 5mins each)<br>
                              - should we record the sessions<br>
                              - should we have the call every week.<br>
                              We have on the backburner:<br>
                              * TDX migration<br>
                            </p>
                          </span></td>
                      </tr>
                    </tbody>
                  </table>
                </td>
              </tr>
            </tbody>
          </table>
        </span></span></blockquote>
    Hi Juan,<br>
    Can I get 30 min (or more if no more other topics)  in tomorrow's
    call to<br>
    continue the discussion on TDX live migration?<br>
    I also did some investigation on the previous comments about
    MigTD-to-MigTD<br>
    communication (remove socat), and have an update to discuss.<br>
    <br>
    Thanks,<br>
    Wei<br>
    <br>
    <blockquote type="cite"
      cite="mid:calendar-639eb22a-8fff-44ce-996b-11c83fd721e8@google.com"><span
        itemscope="" itemtype="http://schema.org/InformAction"><span
          itemprop="object" itemscope=""
          itemtype="http://schema.org/Event">
          <table role="presentation" style="width:100%;"
            class="body-container" cellspacing="0" cellpadding="0"
            border="0" align="center">
            <tbody>
              <tr>
                <td style="" class="" align="left">
                  <table role="presentation" style="width:100%;"
                    class="" cellspacing="0" cellpadding="0" border="0"
                    align="center">
                    <tbody>
                      <tr>
                        <td style="" class="" align="left"><span
                            itemscope=""
                            itemtype="http://schema.org/EmailMessage">
                            <p itemprop="description"> * VFIO/VPDA/Vhost
                              migration<br>
                              * Single binary qemu</p>
                            <p><br>
                              The future of icount</p>
                            <p>Do we have an agenda for next weeks KVM
                              call yet? If there is space I'd<br>
                              like to take some time to discuss the
                              future direction of icount.</p>
                            <p>Specifically I believe there might be
                              some proposals for how we could<br>
                              support icount with MTTCG worth
                              discussing. From my point of view icount<br>
                              provides too things:</p>
                            <p> - a sense of time vaguely related to
                              execution rather than wall clock<br>
                              - determinism </p>
                            <p>I would love to divorce the former from
                              icount and punt it to plugins.<br>
                              The plugin would be free to instrument as
                              heavily or lightly as it sees<br>
                              fit and provide its best guess as to guest
                              time on demand. I wrote this<br>
                              idea up as a card in Linaro's JIRA if
                              anyone is interested:</p>
                            <p> <a
                                href="https://linaro.atlassian.net/browse/QEMU-481"
                                moz-do-not-send="true"
                                class="moz-txt-link-freetext">https://linaro.atlassian.net/browse/QEMU-481</a>
                            </p>
                            <p>Being able to punt cost modelling and
                              sense of time into plugins would<br>
                              allow the core icount support to
                              concentrate on determinism. Then any<br>
                              attempt to enable icount for MTTCG would
                              then have to ensure it stays<br>
                              deterministic.</p>
                            <p>Richard and I have discussed the problem
                              a few times and weren't sure it<br>
                              was solvable but I'm totally open to
                              hearing ideas on how to do it.<br>
                              Fundamentally I think we would have to
                              ensure any TB's doing IO would<br>
                              have to execute in an exclusive context.
                              The TCG code already has<br>
                              mechanisms to ensure all IO is only done
                              at the end of blocks so it<br>
                              doesn't seem a huge leap to ensure we
                              execute those blocks exclusively.<br>
                              However there is still the problem of what
                              to do about other pure<br>
                              computation threads getting ahead or
                              behind of the IO blocks on<br>
                              subsequent runs.<br>
                            </p>
                          </span></td>
                      </tr>
                    </tbody>
                  </table>
                  <table role="presentation" style="width:100%;"
                    class="" cellspacing="0" cellpadding="0" border="0"
                    align="center">
                    <tbody>
                      <tr>
                        <td style="border: solid 1px #dadce0;
                          border-radius: 8px; direction: rtl; font-size:
                          0; padding: 24px 32px; text-align: left;
                          vertical-align: top;"
                          class="main-container-inner"><!--[if mso | IE]><table border="0" cellpadding="0" cellspacing="0" role="presentation"><tr><![endif]-->
                          <div class="" style="font-size: 13px;
                            text-align: left; direction: ltr; display:
                            inline-block; vertical-align: top; width:
                            100%;overflow: hidden; word-wrap:
                            break-word;">
                            <table role="presentation"
                              class="main-column-table-ltr"
                              style="padding-right: 32px; padding-left:
                              0;;table-layout: fixed;" width="100%"
                              cellspacing="0" cellpadding="0" border="0">
                              <tbody>
                                <tr>
                                  <td class="main-column-td"
                                    style="padding:0;
                                    vertical-align:top;">
                                    <table role="presentation"
                                      style="table-layout: fixed;"
                                      width="100%" cellspacing="0"
                                      cellpadding="0" border="0">
                                      <tbody>
                                        <tr>
                                          <td style="font-size: 0;
                                            padding: 0; text-align:
                                            left; word-break:
                                            break-word;;padding-bottom:2px;">
                                            <div style="font-family:
                                              'Google Sans', Roboto,
                                              sans-serif;font-weight:
                                              400; font-size: 22px;
                                              line-height: 28px;color:
                                              #3c4043; text-decoration:
                                              none;"
                                              class="primary-text"
                                              role="presentation"><span
                                                itemprop="name">KVM
                                                developers conference
                                                call</span></div>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td style="font-size: 0;
                                            padding: 0; text-align:
                                            left; word-break:
                                            break-word;;padding-bottom:24px;">
                                            <div style="font-family:
                                              Roboto,
                                              sans-serif;font-style:
                                              normal; font-weight: 400;
                                              font-size: 14px;
                                              line-height: 20px;
                                              letter-spacing:
                                              0.2px;color: #3c4043;
                                              text-decoration: none;"
                                              class="primary-text"
                                              role="presentation"><span
                                                aria-hidden="true"><time
                                                  itemprop="startDate"
                                                  datetime="20230221T140000Z"></time><time
                                                  itemprop="endDate"
                                                  datetime="20230221T150000Z"></time></span><span>Tuesday
                                                2023-02-21 ⋅ 15:00 –
                                                16:00 (Central European
                                                Time - Madrid)</span></div>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td style="font-size: 0;
                                            padding: 0; text-align:
                                            left; word-break:
                                            break-word;;padding-bottom:24px;">
                                            <div style="font-family:
                                              Roboto,
                                              sans-serif;font-style:
                                              normal; font-weight: 400;
                                              font-size: 14px;
                                              line-height: 20px;
                                              letter-spacing:
                                              0.2px;color: #3c4043;
                                              text-decoration: none;"
                                              class="primary-text"
                                              role="presentation"><span>If
                                                you need call details,
                                                please contact me: <a
                                                  href="mailto:quintela@redhat.com"
                                                  target="_blank"
                                                  moz-do-not-send="true"
class="moz-txt-link-freetext">quintela@redhat.com</a></span>
                                              <meta
                                                itemprop="description"
                                                content="If you need
                                                call details, please
                                                contact me:
                                                quintela@redhat.com">
                                            </div>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td style="font-size: 0;
                                            padding: 0; text-align:
                                            left; word-break:
                                            break-word;;padding-bottom:24px;">
                                            <div style="font-family:
                                              Roboto,
                                              sans-serif;font-style:
                                              normal; font-weight: 400;
                                              font-size: 14px;
                                              line-height: 20px;
                                              letter-spacing:
                                              0.2px;color: #3c4043;
                                              text-decoration: none;"
                                              class="primary-text"
                                              role="presentation">
                                              <table role="presentation"
                                                style="padding-bottom:
                                                4px;" cellspacing="0"
                                                cellpadding="0"
                                                border="0">
                                                <tbody>
                                                  <tr>
                                                    <td>
                                                      <h2
                                                        class="primary-text"
style="font-size: 14px;color: #3c4043; text-decoration:
                                                        none;font-weight:
700;-webkit-font-smoothing: antialiased;margin: 0; padding: 0;">Location</h2>
                                                    </td>
                                                  </tr>
                                                </tbody>
                                              </table>
                                              <span itemprop="location"
                                                itemscope=""
                                                itemtype="http://schema.org/Place"><span
                                                  itemprop="name"
                                                  class="primary-text
                                                  notranslate"
                                                  style="font-family:
                                                  Roboto,
                                                  sans-serif;font-style:
                                                  normal; font-weight:
                                                  400; font-size: 14px;
                                                  line-height: 20px;
                                                  letter-spacing:
                                                  0.2px;color: #3c4043;
                                                  text-decoration:
                                                  none;"><a class="moz-txt-link-freetext" href="https://meet.jit.si/kvmcallmeeting">https://meet.jit.si/kvmcallmeeting</a></span><br>
                                                <a
href="https://www.google.com/url?q=https%3A%2F%2Fmeet.jit.si%2Fkvmcallmeeting&amp;sa=D&amp;ust=1677419160000000&amp;usg=AOvVaw0heTI2pkoiDPVZgv6XFxlS"
                                                  class="accent-text
                                                  underline-on-hover"
                                                  style="display:
                                                  inline-block;;color:
                                                  #1a73e8;
                                                  text-decoration:
                                                  none;font-weight:
                                                  700;" target="_blank"
                                                  itemprop="map"
                                                  moz-do-not-send="true">View
                                                  map</a></span></div>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td style="font-size: 0;
                                            padding: 0; text-align:
                                            left; word-break:
                                            break-word;;padding-bottom:24px;">
                                            <div style="font-family:
                                              Roboto,
                                              sans-serif;font-style:
                                              normal; font-weight: 400;
                                              font-size: 14px;
                                              line-height: 20px;
                                              letter-spacing:
                                              0.2px;color: #3c4043;
                                              text-decoration: none;"
                                              class="primary-text"
                                              role="presentation">
                                              <table role="presentation"
                                                style="padding-bottom:
                                                4px;" cellspacing="0"
                                                cellpadding="0"
                                                border="0">
                                                <tbody>
                                                  <tr>
                                                    <td>
                                                      <h2
                                                        class="primary-text"
style="font-size: 14px;color: #3c4043; text-decoration:
                                                        none;font-weight:
700;-webkit-font-smoothing: antialiased;margin: 0; padding: 0;">Guests</h2>
                                                    </td>
                                                  </tr>
                                                </tbody>
                                              </table>
                                              <div
                                                style="padding-bottom:
                                                4px; text-align:
                                                left;;color: #3c4042;">
                                                <div><span
                                                    itemprop="attendee"
                                                    itemscope=""
                                                    itemtype="http://schema.org/Person"><span
                                                      itemprop="name"
                                                      class="notranslate"><a
class="primary-text underline-on-hover" style="display:
                                                        inline-block;;color:
                                                        #3c4043;
                                                        text-decoration:
                                                        none;"
                                                        href="mailto:f4bug@amsat.org"
moz-do-not-send="true">Philippe Mathieu-Daudé</a></span>
                                                    <meta
                                                      itemprop="email"
                                                      content="f4bug@amsat.org">
                                                  </span><span
                                                    class="secondary-text"
                                                    style="color:
                                                    #70757a;
                                                    text-decoration:
                                                    none;"></span></div>
                                                <div><span
                                                    itemprop="attendee"
                                                    itemscope=""
                                                    itemtype="http://schema.org/Person"><span
                                                      itemprop="name"
                                                      class="notranslate"><a
class="primary-text underline-on-hover" style="display:
                                                        inline-block;;color:
                                                        #3c4043;
                                                        text-decoration:
                                                        none;"
                                                        href="mailto:joao.m.martins@oracle.com"
moz-do-not-send="true">Joao Martins</a></span>
                                                    <meta
                                                      itemprop="email"
                                                      content="joao.m.martins@oracle.com">
                                                  </span><span
                                                    class="secondary-text"
                                                    style="color:
                                                    #70757a;
                                                    text-decoration:
                                                    none;"></span></div>
                                                <div><span
                                                    itemprop="attendee"
                                                    itemscope=""
                                                    itemtype="http://schema.org/Person"><span
                                                      itemprop="name"
                                                      class="notranslate"><a
class="primary-text underline-on-hover moz-txt-link-freetext"
                                                        style="display:
inline-block;;color: #3c4043; text-decoration: none;"
                                                        href="mailto:quintela@redhat.com"
moz-do-not-send="true">quintela@redhat.com</a></span>
                                                    <meta
                                                      itemprop="email"
                                                      content="quintela@redhat.com">
                                                  </span><span
                                                    class="secondary-text"
                                                    style="color:
                                                    #70757a;
                                                    text-decoration:
                                                    none;"></span></div>
                                                <div><span
                                                    itemprop="attendee"
                                                    itemscope=""
                                                    itemtype="http://schema.org/Person"><span
                                                      itemprop="name"
                                                      class="notranslate"><a
class="primary-text underline-on-hover" style="display:
                                                        inline-block;;color:
                                                        #3c4043;
                                                        text-decoration:
                                                        none;"
                                                        href="mailto:mdean@redhat.com"
moz-do-not-send="true">Meirav Dean</a></span>
                                                    <meta
                                                      itemprop="email"
                                                      content="mdean@redhat.com">
                                                  </span><span
                                                    class="secondary-text"
                                                    style="color:
                                                    #70757a;
                                                    text-decoration:
                                                    none;"></span></div>
                                                <div><span
                                                    itemprop="attendee"
                                                    itemscope=""
                                                    itemtype="http://schema.org/Person"><span
                                                      itemprop="name"
                                                      class="notranslate"><a
class="primary-text underline-on-hover" style="display:
                                                        inline-block;;color:
                                                        #3c4043;
                                                        text-decoration:
                                                        none;"
                                                        href="mailto:felipe@nutanix.com"
moz-do-not-send="true">Felipe Franciosi</a></span>
                                                    <meta
                                                      itemprop="email"
                                                      content="felipe@nutanix.com">
                                                  </span><span
                                                    class="secondary-text"
                                                    style="color:
                                                    #70757a;
                                                    text-decoration:
                                                    none;"></span></div>
                                                <div><span
                                                    itemprop="attendee"
                                                    itemscope=""
                                                    itemtype="http://schema.org/Person"><span
                                                      itemprop="name"
                                                      class="notranslate"><a
class="primary-text underline-on-hover moz-txt-link-freetext"
                                                        style="display:
inline-block;;color: #3c4043; text-decoration: none;"
                                                        href="mailto:afaerber@suse.de"
moz-do-not-send="true">afaerber@suse.de</a></span>
                                                    <meta
                                                      itemprop="email"
                                                      content="afaerber@suse.de">
                                                  </span><span
                                                    class="secondary-text"
                                                    style="color:
                                                    #70757a;
                                                    text-decoration:
                                                    none;"></span></div>
                                                <div><span
                                                    itemprop="attendee"
                                                    itemscope=""
                                                    itemtype="http://schema.org/Person"><span
                                                      itemprop="name"
                                                      class="notranslate"><a
class="primary-text underline-on-hover moz-txt-link-freetext"
                                                        style="display:
inline-block;;color: #3c4043; text-decoration: none;"
                                                        href="mailto:bazulay@redhat.com"
moz-do-not-send="true">bazulay@redhat.com</a></span>
                                                    <meta
                                                      itemprop="email"
                                                      content="bazulay@redhat.com">
                                                  </span><span
                                                    class="secondary-text"
                                                    style="color:
                                                    #70757a;
                                                    text-decoration:
                                                    none;"></span></div>
                                                <div><span
                                                    itemprop="attendee"
                                                    itemscope=""
                                                    itemtype="http://schema.org/Person"><span
                                                      itemprop="name"
                                                      class="notranslate"><a
class="primary-text underline-on-hover moz-txt-link-freetext"
                                                        style="display:
inline-block;;color: #3c4043; text-decoration: none;"
                                                        href="mailto:bbauman@redhat.com"
moz-do-not-send="true">bbauman@redhat.com</a></span>
                                                    <meta
                                                      itemprop="email"
                                                      content="bbauman@redhat.com">
                                                  </span><span
                                                    class="secondary-text"
                                                    style="color:
                                                    #70757a;
                                                    text-decoration:
                                                    none;"></span></div>
                                                <div><span
                                                    itemprop="attendee"
                                                    itemscope=""
                                                    itemtype="http://schema.org/Person"><span
                                                      itemprop="name"
                                                      class="notranslate"><a
class="primary-text underline-on-hover moz-txt-link-freetext"
                                                        style="display:
inline-block;;color: #3c4043; text-decoration: none;"
                                                        href="mailto:cw@f00f.org"
moz-do-not-send="true">cw@f00f.org</a></span>
                                                    <meta
                                                      itemprop="email"
                                                      content="cw@f00f.org">
                                                  </span><span
                                                    class="secondary-text"
                                                    style="color:
                                                    #70757a;
                                                    text-decoration:
                                                    none;"></span></div>
                                                <div><span
                                                    itemprop="attendee"
                                                    itemscope=""
                                                    itemtype="http://schema.org/Person"><span
                                                      itemprop="name"
                                                      class="notranslate"><a
class="primary-text underline-on-hover moz-txt-link-freetext"
                                                        style="display:
inline-block;;color: #3c4043; text-decoration: none;"
                                                        href="mailto:dustin.kirkland@canonical.com"
moz-do-not-send="true">dustin.kirkland@canonical.com</a></span>
                                                    <meta
                                                      itemprop="email"
                                                      content="dustin.kirkland@canonical.com">
                                                  </span><span
                                                    class="secondary-text"
                                                    style="color:
                                                    #70757a;
                                                    text-decoration:
                                                    none;"></span></div>
                                                <div><span
                                                    itemprop="attendee"
                                                    itemscope=""
                                                    itemtype="http://schema.org/Person"><span
                                                      itemprop="name"
                                                      class="notranslate"><a
class="primary-text underline-on-hover moz-txt-link-freetext"
                                                        style="display:
inline-block;;color: #3c4043; text-decoration: none;"
                                                        href="mailto:eblake@redhat.com"
moz-do-not-send="true">eblake@redhat.com</a></span>
                                                    <meta
                                                      itemprop="email"
                                                      content="eblake@redhat.com">
                                                  </span><span
                                                    class="secondary-text"
                                                    style="color:
                                                    #70757a;
                                                    text-decoration:
                                                    none;"></span></div>
                                                <div><span
                                                    itemprop="attendee"
                                                    itemscope=""
                                                    itemtype="http://schema.org/Person"><span
                                                      itemprop="name"
                                                      class="notranslate"><a
class="primary-text underline-on-hover moz-txt-link-freetext"
                                                        style="display:
inline-block;;color: #3c4043; text-decoration: none;"
                                                        href="mailto:edgar.iglesias@gmail.com"
moz-do-not-send="true">edgar.iglesias@gmail.com</a></span>
                                                    <meta
                                                      itemprop="email"
                                                      content="edgar.iglesias@gmail.com">
                                                  </span><span
                                                    class="secondary-text"
                                                    style="color:
                                                    #70757a;
                                                    text-decoration:
                                                    none;"></span></div>
                                                <div><span
                                                    itemprop="attendee"
                                                    itemscope=""
                                                    itemtype="http://schema.org/Person"><span
                                                      itemprop="name"
                                                      class="notranslate"><a
class="primary-text underline-on-hover" style="display:
                                                        inline-block;;color:
                                                        #3c4043;
                                                        text-decoration:
                                                        none;"
                                                        href="mailto:digitaleric@google.com"
moz-do-not-send="true">Eric Northup</a></span>
                                                    <meta
                                                      itemprop="email"
                                                      content="digitaleric@google.com">
                                                  </span><span
                                                    class="secondary-text"
                                                    style="color:
                                                    #70757a;
                                                    text-decoration:
                                                    none;"></span></div>
                                                <div><span
                                                    itemprop="attendee"
                                                    itemscope=""
                                                    itemtype="http://schema.org/Person"><span
                                                      itemprop="name"
                                                      class="notranslate"><a
class="primary-text underline-on-hover moz-txt-link-freetext"
                                                        style="display:
inline-block;;color: #3c4043; text-decoration: none;"
                                                        href="mailto:eric.auger@redhat.com"
moz-do-not-send="true">eric.auger@redhat.com</a></span>
                                                    <meta
                                                      itemprop="email"
                                                      content="eric.auger@redhat.com">
                                                  </span><span
                                                    class="secondary-text"
                                                    style="color:
                                                    #70757a;
                                                    text-decoration:
                                                    none;"></span></div>
                                                <div><span
                                                    itemprop="attendee"
                                                    itemscope=""
                                                    itemtype="http://schema.org/Person"><span
                                                      itemprop="name"
                                                      class="notranslate"><a
class="primary-text underline-on-hover moz-txt-link-freetext"
                                                        style="display:
inline-block;;color: #3c4043; text-decoration: none;"
                                                        href="mailto:iggy@theiggy.com"
moz-do-not-send="true">iggy@theiggy.com</a></span>
                                                    <meta
                                                      itemprop="email"
                                                      content="iggy@theiggy.com">
                                                  </span><span
                                                    class="secondary-text"
                                                    style="color:
                                                    #70757a;
                                                    text-decoration:
                                                    none;"></span></div>
                                                <div><span
                                                    itemprop="attendee"
                                                    itemscope=""
                                                    itemtype="http://schema.org/Person"><span
                                                      itemprop="name"
                                                      class="notranslate"><a
class="primary-text underline-on-hover moz-txt-link-freetext"
                                                        style="display:
inline-block;;color: #3c4043; text-decoration: none;"
                                                        href="mailto:jan.kiszka@web.de"
moz-do-not-send="true">jan.kiszka@web.de</a></span>
                                                    <meta
                                                      itemprop="email"
                                                      content="jan.kiszka@web.de">
                                                  </span><span
                                                    class="secondary-text"
                                                    style="color:
                                                    #70757a;
                                                    text-decoration:
                                                    none;"></span></div>
                                                <div><span
                                                    itemprop="attendee"
                                                    itemscope=""
                                                    itemtype="http://schema.org/Person"><span
                                                      itemprop="name"
                                                      class="notranslate"><a
class="primary-text underline-on-hover moz-txt-link-freetext"
                                                        style="display:
inline-block;;color: #3c4043; text-decoration: none;"
                                                        href="mailto:jidong.xiao@gmail.com"
moz-do-not-send="true">jidong.xiao@gmail.com</a></span>
                                                    <meta
                                                      itemprop="email"
                                                      content="jidong.xiao@gmail.com">
                                                  </span><span
                                                    class="secondary-text"
                                                    style="color:
                                                    #70757a;
                                                    text-decoration:
                                                    none;"></span></div>
                                                <div><span
                                                    itemprop="attendee"
                                                    itemscope=""
                                                    itemtype="http://schema.org/Person"><span
                                                      itemprop="name"
                                                      class="notranslate"><a
class="primary-text underline-on-hover moz-txt-link-freetext"
                                                        style="display:
inline-block;;color: #3c4043; text-decoration: none;"
                                                        href="mailto:jjherne@linux.vnet.ibm.com"
moz-do-not-send="true">jjherne@linux.vnet.ibm.com</a></span>
                                                    <meta
                                                      itemprop="email"
                                                      content="jjherne@linux.vnet.ibm.com">
                                                  </span><span
                                                    class="secondary-text"
                                                    style="color:
                                                    #70757a;
                                                    text-decoration:
                                                    none;"></span></div>
                                                <div><span
                                                    itemprop="attendee"
                                                    itemscope=""
                                                    itemtype="http://schema.org/Person"><span
                                                      itemprop="name"
                                                      class="notranslate"><a
class="primary-text underline-on-hover moz-txt-link-freetext"
                                                        style="display:
inline-block;;color: #3c4043; text-decoration: none;"
                                                        href="mailto:mimu@linux.vnet.ibm.com"
moz-do-not-send="true">mimu@linux.vnet.ibm.com</a></span>
                                                    <meta
                                                      itemprop="email"
                                                      content="mimu@linux.vnet.ibm.com">
                                                  </span><span
                                                    class="secondary-text"
                                                    style="color:
                                                    #70757a;
                                                    text-decoration:
                                                    none;"></span></div>
                                                <div><span
                                                    itemprop="attendee"
                                                    itemscope=""
                                                    itemtype="http://schema.org/Person"><span
                                                      itemprop="name"
                                                      class="notranslate"><a
class="primary-text underline-on-hover" style="display:
                                                        inline-block;;color:
                                                        #3c4043;
                                                        text-decoration:
                                                        none;"
                                                        href="mailto:peter.maydell@linaro.org"
moz-do-not-send="true">Peter Maydell</a></span>
                                                    <meta
                                                      itemprop="email"
                                                      content="peter.maydell@linaro.org">
                                                  </span><span
                                                    class="secondary-text"
                                                    style="color:
                                                    #70757a;
                                                    text-decoration:
                                                    none;"></span></div>
                                                <div><span
                                                    itemprop="attendee"
                                                    itemscope=""
                                                    itemtype="http://schema.org/Person"><span
                                                      itemprop="name"
                                                      class="notranslate"><a
class="primary-text underline-on-hover moz-txt-link-freetext"
                                                        style="display:
inline-block;;color: #3c4043; text-decoration: none;"
                                                        href="mailto:richard.henderson@linaro.org"
moz-do-not-send="true">richard.henderson@linaro.org</a></span>
                                                    <meta
                                                      itemprop="email"
                                                      content="richard.henderson@linaro.org">
                                                  </span><span
                                                    class="secondary-text"
                                                    style="color:
                                                    #70757a;
                                                    text-decoration:
                                                    none;"></span></div>
                                                <div><span
                                                    itemprop="attendee"
                                                    itemscope=""
                                                    itemtype="http://schema.org/Person"><span
                                                      itemprop="name"
                                                      class="notranslate"><a
class="primary-text underline-on-hover moz-txt-link-freetext"
                                                        style="display:
inline-block;;color: #3c4043; text-decoration: none;"
                                                        href="mailto:stefanha@gmail.com"
moz-do-not-send="true">stefanha@gmail.com</a></span>
                                                    <meta
                                                      itemprop="email"
                                                      content="stefanha@gmail.com">
                                                  </span><span
                                                    class="secondary-text"
                                                    style="color:
                                                    #70757a;
                                                    text-decoration:
                                                    none;"></span></div>
                                                <div><span
                                                    itemprop="attendee"
                                                    itemscope=""
                                                    itemtype="http://schema.org/Person"><span
                                                      itemprop="name"
                                                      class="notranslate"><a
class="primary-text underline-on-hover" style="display:
                                                        inline-block;;color:
                                                        #3c4043;
                                                        text-decoration:
                                                        none;"
                                                        href="mailto:imp@bsdimp.com"
moz-do-not-send="true">Warner Losh</a></span>
                                                    <meta
                                                      itemprop="email"
                                                      content="imp@bsdimp.com">
                                                  </span><span
                                                    class="secondary-text"
                                                    style="color:
                                                    #70757a;
                                                    text-decoration:
                                                    none;"></span></div>
                                                <div><span
                                                    itemprop="attendee"
                                                    itemscope=""
                                                    itemtype="http://schema.org/Person"><span
                                                      itemprop="name"
                                                      class="notranslate"><a
class="primary-text underline-on-hover moz-txt-link-freetext"
                                                        style="display:
inline-block;;color: #3c4043; text-decoration: none;"
                                                        href="mailto:z.huo@139.com"
moz-do-not-send="true">z.huo@139.com</a></span>
                                                    <meta
                                                      itemprop="email"
                                                      content="z.huo@139.com">
                                                  </span><span
                                                    class="secondary-text"
                                                    style="color:
                                                    #70757a;
                                                    text-decoration:
                                                    none;"></span></div>
                                                <div><span
                                                    itemprop="attendee"
                                                    itemscope=""
                                                    itemtype="http://schema.org/Person"><span
                                                      itemprop="name"
                                                      class="notranslate"><a
class="primary-text underline-on-hover moz-txt-link-freetext"
                                                        style="display:
inline-block;;color: #3c4043; text-decoration: none;"
                                                        href="mailto:zwu.kernel@gmail.com"
moz-do-not-send="true">zwu.kernel@gmail.com</a></span>
                                                    <meta
                                                      itemprop="email"
                                                      content="zwu.kernel@gmail.com">
                                                  </span><span
                                                    class="secondary-text"
                                                    style="color:
                                                    #70757a;
                                                    text-decoration:
                                                    none;"></span></div>
                                                <div><span
                                                    itemprop="attendee"
                                                    itemscope=""
                                                    itemtype="http://schema.org/Person"><span
                                                      itemprop="name"
                                                      class="notranslate"><a
class="primary-text underline-on-hover" style="display:
                                                        inline-block;;color:
                                                        #3c4043;
                                                        text-decoration:
                                                        none;"
                                                        href="mailto:jgg@nvidia.com"
moz-do-not-send="true">Jason Gunthorpe</a></span>
                                                    <meta
                                                      itemprop="email"
                                                      content="jgg@nvidia.com">
                                                  </span><span
                                                    class="secondary-text"
                                                    style="color:
                                                    #70757a;
                                                    text-decoration:
                                                    none;"></span></div>
                                                <div><span
                                                    itemprop="attendee"
                                                    itemscope=""
                                                    itemtype="http://schema.org/Person"><span
                                                      itemprop="name"
                                                      class="notranslate"><a
class="primary-text underline-on-hover" style="display:
                                                        inline-block;;color:
                                                        #3c4043;
                                                        text-decoration:
                                                        none;"
                                                        href="mailto:cjia@nvidia.com"
moz-do-not-send="true">Neo Jia</a></span>
                                                    <meta
                                                      itemprop="email"
                                                      content="cjia@nvidia.com">
                                                  </span><span
                                                    class="secondary-text"
                                                    style="color:
                                                    #70757a;
                                                    text-decoration:
                                                    none;"></span></div>
                                                <div><span
                                                    itemprop="attendee"
                                                    itemscope=""
                                                    itemtype="http://schema.org/Person"><span
                                                      itemprop="name"
                                                      class="notranslate"><a
class="primary-text underline-on-hover" style="display:
                                                        inline-block;;color:
                                                        #3c4043;
                                                        text-decoration:
                                                        none;"
                                                        href="mailto:david.edmondson@oracle.com"
moz-do-not-send="true">David Edmondson</a></span>
                                                    <meta
                                                      itemprop="email"
                                                      content="david.edmondson@oracle.com">
                                                  </span><span
                                                    class="secondary-text"
                                                    style="color:
                                                    #70757a;
                                                    text-decoration:
                                                    none;"></span></div>
                                                <div><span
                                                    itemprop="attendee"
                                                    itemscope=""
                                                    itemtype="http://schema.org/Person"><span
                                                      itemprop="name"
                                                      class="notranslate"><a
class="primary-text underline-on-hover" style="display:
                                                        inline-block;;color:
                                                        #3c4043;
                                                        text-decoration:
                                                        none;"
                                                        href="mailto:elena.ufimtseva@oracle.com"
moz-do-not-send="true">Elena Ufimtseva</a></span>
                                                    <meta
                                                      itemprop="email"
                                                      content="elena.ufimtseva@oracle.com">
                                                  </span><span
                                                    class="secondary-text"
                                                    style="color:
                                                    #70757a;
                                                    text-decoration:
                                                    none;"></span></div>
                                                <div><span
                                                    itemprop="attendee"
                                                    itemscope=""
                                                    itemtype="http://schema.org/Person"><span
                                                      itemprop="name"
                                                      class="notranslate"><a
class="primary-text underline-on-hover" style="display:
                                                        inline-block;;color:
                                                        #3c4043;
                                                        text-decoration:
                                                        none;"
                                                        href="mailto:konrad.wilk@oracle.com"
moz-do-not-send="true">Konrad Wilk</a></span>
                                                    <meta
                                                      itemprop="email"
                                                      content="konrad.wilk@oracle.com">
                                                  </span><span
                                                    class="secondary-text"
                                                    style="color:
                                                    #70757a;
                                                    text-decoration:
                                                    none;"></span></div>
                                                <div><span
                                                    itemprop="attendee"
                                                    itemscope=""
                                                    itemtype="http://schema.org/Person"><span
                                                      itemprop="name"
                                                      class="notranslate"><a
class="primary-text underline-on-hover moz-txt-link-freetext"
                                                        style="display:
inline-block;;color: #3c4043; text-decoration: none;"
                                                        href="mailto:ale@rev.ng"
moz-do-not-send="true">ale@rev.ng</a></span>
                                                    <meta
                                                      itemprop="email"
                                                      content="ale@rev.ng">
                                                  </span><span
                                                    class="secondary-text"
                                                    style="color:
                                                    #70757a;
                                                    text-decoration:
                                                    none;"></span></div>
                                                <div><span
                                                    itemprop="attendee"
                                                    itemscope=""
                                                    itemtype="http://schema.org/Person"><span
                                                      itemprop="name"
                                                      class="notranslate"><a
class="primary-text underline-on-hover moz-txt-link-freetext"
                                                        style="display:
inline-block;;color: #3c4043; text-decoration: none;"
                                                        href="mailto:anjo@rev.ng"
moz-do-not-send="true">anjo@rev.ng</a></span>
                                                    <meta
                                                      itemprop="email"
                                                      content="anjo@rev.ng">
                                                  </span><span
                                                    class="secondary-text"
                                                    style="color:
                                                    #70757a;
                                                    text-decoration:
                                                    none;"></span></div>
                                                <div><span
                                                    itemprop="attendee"
                                                    itemscope=""
                                                    itemtype="http://schema.org/Person"><span
                                                      itemprop="name"
                                                      class="notranslate"><a
class="primary-text underline-on-hover" style="display:
                                                        inline-block;;color:
                                                        #3c4043;
                                                        text-decoration:
                                                        none;"
                                                        href="mailto:shameerali.kolothum.thodi@huawei.com"
moz-do-not-send="true">Shameerali Kolothum Thodi</a></span>
                                                    <meta
                                                      itemprop="email"
                                                      content="shameerali.kolothum.thodi@huawei.com">
                                                  </span><span
                                                    class="secondary-text"
                                                    style="color:
                                                    #70757a;
                                                    text-decoration:
                                                    none;"></span></div>
                                                <div><span
                                                    itemprop="attendee"
                                                    itemscope=""
                                                    itemtype="http://schema.org/Person"><span
                                                      itemprop="name"
                                                      class="notranslate"><a
class="primary-text underline-on-hover" style="display:
                                                        inline-block;;color:
                                                        #3c4043;
                                                        text-decoration:
                                                        none;"
                                                        href="mailto:wei.w.wang@intel.com"
moz-do-not-send="true">Wang, Wei W</a></span>
                                                    <meta
                                                      itemprop="email"
                                                      content="wei.w.wang@intel.com">
                                                  </span><span
                                                    class="secondary-text"
                                                    style="color:
                                                    #70757a;
                                                    text-decoration:
                                                    none;"></span></div>
                                                <div><span
                                                    itemprop="attendee"
                                                    itemscope=""
                                                    itemtype="http://schema.org/Person"><span
                                                      itemprop="name"
                                                      class="notranslate"><a
class="primary-text underline-on-hover" style="display:
                                                        inline-block;;color:
                                                        #3c4043;
                                                        text-decoration:
                                                        none;"
                                                        href="mailto:chao.p.peng@linux.intel.com"
moz-do-not-send="true">Chao Peng</a></span>
                                                    <meta
                                                      itemprop="email"
                                                      content="chao.p.peng@linux.intel.com">
                                                  </span><span
                                                    class="secondary-text"
                                                    style="color:
                                                    #70757a;
                                                    text-decoration:
                                                    none;"></span></div>
                                                <div><span
                                                    itemprop="attendee"
                                                    itemscope=""
                                                    itemtype="http://schema.org/Person"><span
                                                      itemprop="name"
                                                      class="notranslate"><a
class="primary-text underline-on-hover" style="display:
                                                        inline-block;;color:
                                                        #3c4043;
                                                        text-decoration:
                                                        none;"
                                                        href="mailto:kvm@vger.kernel.org"
moz-do-not-send="true">kvm-devel</a></span>
                                                    <meta
                                                      itemprop="email"
                                                      content="kvm@vger.kernel.org">
                                                  </span><span
                                                    class="secondary-text"
                                                    style="color:
                                                    #70757a;
                                                    text-decoration:
                                                    none;"></span></div>
                                                <div><span
                                                    itemprop="attendee"
                                                    itemscope=""
                                                    itemtype="http://schema.org/Person"><span
                                                      itemprop="name"
                                                      class="notranslate"><a
class="primary-text underline-on-hover moz-txt-link-freetext"
                                                        style="display:
inline-block;;color: #3c4043; text-decoration: none;"
                                                        href="mailto:qemu-devel@nongnu.org"
moz-do-not-send="true">qemu-devel@nongnu.org</a></span>
                                                    <meta
                                                      itemprop="email"
                                                      content="qemu-devel@nongnu.org">
                                                  </span><span
                                                    class="secondary-text"
                                                    style="color:
                                                    #70757a;
                                                    text-decoration:
                                                    none;"></span></div>
                                                <div><span
                                                    itemprop="attendee"
                                                    itemscope=""
                                                    itemtype="http://schema.org/Person"><span
                                                      itemprop="name"
                                                      class="notranslate"><a
class="primary-text underline-on-hover moz-txt-link-freetext"
                                                        style="display:
inline-block;;color: #3c4043; text-decoration: none;"
                                                        href="mailto:mburton@qti.qualcomm.com"
moz-do-not-send="true">mburton@qti.qualcomm.com</a></span>
                                                    <meta
                                                      itemprop="email"
                                                      content="mburton@qti.qualcomm.com">
                                                  </span><span
                                                    class="secondary-text"
                                                    style="color:
                                                    #70757a;
                                                    text-decoration:
                                                    none;"></span></div>
                                              </div>
                                            </div>
                                          </td>
                                        </tr>
                                      </tbody>
                                    </table>
                                  </td>
                                </tr>
                              </tbody>
                            </table>
                          </div>
                          <!--[if mso | IE]></tr></table><![endif]--></td>
                      </tr>
                    </tbody>
                  </table>
                </td>
              </tr>
            </tbody>
          </table>
        </span></span>
    </blockquote>
    <br>
  </body>
</html>

--------------uvxlCCAxGYsMSLnvx1m3jht9--

